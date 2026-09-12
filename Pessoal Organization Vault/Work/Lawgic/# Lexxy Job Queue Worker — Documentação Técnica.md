# Lexxy Job Queue Worker — Documentação Técnica

## Contexto e Motivação

  
Antes da existência desse worker, ao criar um processo no sistema, eram disparadas requisições HTTP (axios) diretamente para os endpoints responsáveis por criar os fluxos e tarefas vinculados. O problema dessa abordagem é que **qualquer falha na requisição resultava na perda silenciosa** de fluxos ou tarefas — o processo era criado, mas os vínculos nunca eram estabelecidos.

  
**A solução:** ao criar um processo, uma transaction de banco de dados garante que tanto o processo quanto os registros na tabela `processQueue` sejam criados atomicamente. Se algo falhar, tudo é revertido. Os registros na fila são então processados por esse worker de forma assíncrona e com retry automático.  

---
## Responsabilidade do Worker


O worker é responsável por **consumir a fila de jobs** (`processQueue`) e executar a lógica de criação dos fluxos e tarefas atrelados a um processo. Cada job representa uma ação pendente que precisa ser executada — seja criar uma audiência, um prazo, uma OBF, vincular uma publicação, etc.

  

---

## Estrutura de Pastas

  

```

lexxy-job-queue-worker/

├── config/

│ ├── database.js # Configurações de banco por ambiente (local/dev/prod)

│ ├── get-env.js # Utilitário para leitura de variáveis de ambiente

│ └── solucionare.js # Configuração da integração com a API Solucionare

│

├── models/

│ └── index.js # Singleton DatabaseModels — inicializa Sequelize e carrega models

│

├── src/

│ ├── _shared/

│ │ ├── constants/

│ │ │ ├── flows.constants.js # Enum dos tipos de fluxo (AUDIENCE, OBF, TASK...)

│ │ │ └── queues.constants.js # Enum de status da fila (PENDING, PROCESSING, DONE, ERROR)

│ │ ├── helpers/

│ │ │ ├── auth.helpers.js # Geração de JWT para chamadas internas

│ │ │ ├── date.helpers.js # Utilitário de cálculo de dias (daysUntil)

│ │ │ └── tasks.helpers.js # Função centralizada de criação de tarefas via API

│ │ └── repositories/

│ │ └── process-queue.repository.js # CRUD da tabela processQueue

│ │

│ ├── modules/

│ │ ├── queues/

│ │ │ ├── constants/

│ │ │ │ └── process-queue.constants.js # Constante do tipo 'processQueue'

│ │ │ └── lawsuit.queue.js # Roteador central: mapeia flowType → service

│ │ │

│ │ ├── flows/

│ │ │ ├── audience/ # Fluxo: Audiência (criação + tarefa de verificação)

│ │ │ ├── capture/ # Fluxo: Captura de andamento processual (Solucionare)

│ │ │ ├── deadline/ # Fluxo: Prazo processual (ciência de prazo)

│ │ │ ├── non-judicial/ # Fluxo: Extrajudicial customizável por grupo

│ │ │ ├── obf/ # Fluxo: Obrigação de Fazer

│ │ │ ├── publication/ # Fluxo: Vinculação de publicação ao processo

│ │ │ ├── register/ # Fluxo: Registro de novo processo

│ │ │ └── subsidy/ # Fluxo: Subsídios

│ │ │

│ │ └── tasks/

│ │ └── tasks.service.js # Serviço de criação de tarefa via API interna

│ │

│ └── worker.js # Processador de job: abre transaction e roteia para a fila correta

│

├── index.js # Entry point: cron a cada 5s, busca jobs e despacha para o worker

├── .env.example # Variáveis de ambiente necessárias

└── package.json

```

  

---

  

## Fluxo de Execução

  

```

Criação do Processo (sistema externo)

│

▼ (dentro de uma transaction)

Registro na tabela processQueue ──── status: PENDING

│

▼ (a cada 5 segundos)

index.js — Cron Job

│

├─ Busca jobs com status PENDING ou ERROR (máx. 6 por ciclo)

├─ Aplica pessimistic lock (FOR UPDATE SKIP LOCKED) para evitar processamento duplicado

├─ Incrementa attempts e atualiza status para PROCESSING (dentro de transaction)

│

▼

src/worker.js — processJob()

│

├─ Abre nova transaction

├─ Identifica o queueType do job

├─ Roteia para LawsuitQueue.init()

│

▼

src/modules/queues/lawsuit.queue.js — LawsuitQueue

│

├─ Mapeia flowType → Service handler

│

▼

Service específico (ex: AudienceService, ObfService...)

│

├─ Cria registros no banco (audience, obf, subsidy...)

├─ Pode enfileirar novos jobs dependentes (ex: audiência → tarefa de preposto)

│

▼

Sucesso → status: DONE | Falha → status: ERROR (elegível para retry)

```

  

---

  

## Estratégia de Retry e Tolerância a Falhas

  

| Situação | Comportamento |

|---|---|

| Job falha na primeira execução | Status muda para `ERROR`, job fica elegível para retry |

| Retry bem-sucedido | Status muda para `DONE` |

| Job atinge 6 tentativas sem sucesso | Marcado como `DONE` e o erro é registrado em `logError` |

| Payload inválido | Marcado imediatamente como `DONE` sem tentar processar |

| Falha crítica no ciclo | Transaction é revertida, job permanece com status anterior |

  

O campo `logError` da tabela `processQueue` armazena a mensagem de erro da última tentativa falha para facilitar debugging.

  

---

  

## Tipos de Fluxo (`flowType`)

  

Cada job na fila possui um `flowType` que determina qual serviço será responsável pelo processamento:

  

| flowType | Serviço | Responsabilidade |

|---|---|---|

| `audience` | AudienceService | Cria registro de audiência e enfileira tarefa de verificação de preposto/testemunha |

| `capture` | CaptureService | Integra com a API Solucionare para rastrear andamento processual |

| `deadline` | DeadlineService | Cria tarefa de ciência de prazo (contestação/resposta) |

| `nonJudicial` | NonJudicialService | Roteia para API externa configurável por grupo |

| `obf` | ObfService | Cria registro de Obrigação de Fazer e tarefa de validação |

| `publication` | PublicationService | Vincula publicações existentes ao processo recém-criado |

| `register` | RegisterService | Notifica advogados internos/externos sobre novo processo |

| `subsidy` | SubsidyService | Cria registro de subsídio e tarefa de seleção |

| `task` | TasksService | Cria uma tarefa avulsa via API interna |

  

---

  

## Ciclos de Vida de um Job

  

```

PENDING ──► PROCESSING ──► DONE (sucesso na primeira tentativa)

PENDING ──► PROCESSING ──► ERROR (falha, retry elegível)

ERROR ──► PROCESSING ──► DONE (retry bem-sucedido)

ERROR ──► PROCESSING ──► ERROR (retry falhou novamente)

ERROR ──► DONE (esgotou as 6 tentativas)

```

  

---

  

## Jobs Encadeados (Cascading Workflows)

  

Alguns fluxos enfileiram novos jobs como parte do seu processamento. Isso permite que workflows complexos sejam quebrados em etapas independentes e resilientes:

  

```

Registro de Audiência

│

└─► Enfileira job do tipo TASK

│

└─► TasksService cria tarefa "Verificar preposto e testemunha"

```

  

O encadeamento é feito via `ProcessQueueRepository.queue()`, que usa `findOrCreate` para evitar duplicatas caso o job já exista.

  

---

  

## Locking e Concorrência

  

O worker utiliza **pessimistic locking** no PostgreSQL (`SELECT ... FOR UPDATE SKIP LOCKED`) para garantir que múltiplas instâncias do worker rodando em paralelo não processem o mesmo job duas vezes.

  

- `FOR UPDATE` — adquire lock exclusivo nas linhas selecionadas

- `SKIP LOCKED` — pula linhas já bloqueadas por outro processo, em vez de esperar

  

Isso permite escalar o worker horizontalmente sem risco de processamento duplicado.

  

---

  

## Integrações Externas

  

| Sistema | Uso |

|---|---|

| API Interna (`URL_API`) | Criação de tarefas via `/v1/tasks/internal-task-create` |

| Solucionare API | Registro e rastreamento de andamento processual no sistema externo |

| APIs customizadas por grupo | Fluxos `nonJudicial` e `subsidy` com comportamento configurável por `groupId` |

  

A autenticação entre serviços internos é feita via JWT gerado pelo `auth.helpers.js`, com expiração padrão de 30 dias e identificação do serviço como `lexxy-job-queue-worker`.

  

---

  

## Variáveis de Ambiente Necessárias

  

| Variável | Descrição |

|---|---|

| `NODE_ENV` | Ambiente de execução (`development`, `production`) |

| `DB_HOST` | Host do banco PostgreSQL |

| `DB_USERNAME` | Usuário do banco |

| `DB_DATABASE` | Nome do banco |

| `DB_PASSWORD` | Senha do banco |

| `DB_DIALECT` | Dialeto Sequelize (`postgres`) |

| `DB_SCHEMA` | Schema do banco (ex: `register`) |

| `DB_LOGGING` | Habilitar logs de queries SQL |

| `INTERNAL_SECRET` | Secret para geração de JWT interno |

| `URL_API` | Base URL da API interna |

| `SOLUCIONARE_BASE_URL` | Base URL da API Solucionare |

| `SOLUCIONARE_NOME_RELACIONAL` | Nome relacional para autenticação Solucionare |

| `SOLUCIONARE_TOKEN` | Token de autenticação Solucionare |


---