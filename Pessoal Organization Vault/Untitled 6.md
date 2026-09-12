{
  "process": {
    "fields": [
      {
        "key": "createdAt",
        "type": "date",
        "title": "Data de criação",
        "options": [
          {
            "label": "Hoje",
            "value": "today"
          },
          {
            "label": "Ontem",
            "value": "yesterday"
          },
          {
            "label": "Esta semana",
            "value": "thisWeek"
          },
          {
            "label": "Semana passada",
            "value": "lastWeek"
          },
          {
            "label": "Esse mês",
            "value": "thisMonth"
          },
          {
            "label": "Mês passado",
            "value": "lastMonth"
          },
          {
            "label": "Esse ano",
            "value": "thisYear"
          },
          {
            "label": "Ano passado",
            "value": "lastYear"
          }
        ]
      },
      {
        "key": "stateUf",
        "type": "checkbox",
        "title": "UF",
        "options": [],
        "requestProps": {
          "route": "filters/state-uf",
          "method": "get",
          "serviceName": "register",
          "functionName": "getFilterOptions"
        }
      },
      {
        "key": "processStatus",
        "type": "checkbox",
        "title": "status",
        "options": [
          {
            "label": "Ativo",
            "value": "Ativo"
          },
          {
            "label": "Encerrado",
            "value": "Encerrado"
          }
        ]
      },
      {
        "key": "processPhase",
        "type": "checkbox",
        "title": "Fase do processo",
        "customFieldsId": "d9e33938-5890-46fc-a5cf-5ce98633dc84",
        "options": []
      },
      {
        "key": "risk",
        "type": "checkbox",
        "title": "Risco",
        "options": [
          {
            "label": "Não aplicável",
            "value": "Não aplicável"
          },
          {
            "label": "Possível",
            "value": "Possível"
          },
          {
            "label": "Provável",
            "value": "Provável"
          },
          {
            "label": "Remoto",
            "value": "Remoto"
          }
        ]
      },
      {
        "key": "bpo",
        "type": "checkbox",
        "title": "Processo BPO",
        "options": [
          {
            "label": "Sim",
            "value": true
          },
          {
            "label": "Não",
            "value": false
          }
        ]
      },
      {
        "key": "internalLawyerId",
        "type": "checkbox",
        "title": "Equipe interna",
        "options": [],
        "requestProps": {
          "route": "filters/teams/3",
          "method": "get",
          "serviceName": "register",
          "functionName": "getFilterOptions"
        }
      },
      {
        "key": "externalLawyerId",
        "type": "checkbox",
        "title": "Equipe externa",
        "options": [],
        "requestProps": {
          "route": "filters/teams/2",
          "method": "get",
          "serviceName": "register",
          "functionName": "getFilterOptions"
        }
      }
    ],
    "search": [
      {
        "key": "processNumber",
        "title": "Número do processo"
      }
    ]
  },
  "task": {
    "fields": [
      {
        "key": "createdAt",
        "type": "date",
        "title": "Data de criação",
        "options": [
          {
            "label": "Hoje",
            "value": "today"
          },
          {
            "label": "Ontem",
            "value": "yesterday"
          },
          {
            "label": "Esta semana",
            "value": "thisWeek"
          },
          {
            "label": "Semana passada",
            "value": "lastWeek"
          },
          {
            "label": "Esse mês",
            "value": "thisMonth"
          },
          {
            "label": "Mês passado",
            "value": "lastMonth"
          },
          {
            "label": "Esse ano",
            "value": "thisYear"
          },
          {
            "label": "Ano passado",
            "value": "lastYear"
          }
        ]
      },
      {
        "key": "status",
        "type": "checkbox",
        "title": "Status",
        "options": [
          {
            "label": "Aceito",
            "value": "Aceito"
          },
          {
            "label": "Recusado",
            "value": "Recusado"
          },
          {
            "label": "Arquivado",
            "value": "Arquivado"
          },
          {
            "label": "Finalizado",
            "value": "Finalizado"
          },
          {
            "label": "Aguardando ação",
            "value": "Aguardando ação"
          },
          {
            "label": "Vencido",
            "value": "Vencido"
          }
        ]
      },
      {
        "key": "taskType",
        "type": "checkbox",
        "title": "Fluxo",
        "options": [
          {
            "label": "OBF",
            "value": "OBF"
          },
          {
            "label": "Subsídios",
            "value": "Subsídios"
          },
          {
            "label": "Audiência",
            "value": "Audiência"
          },
          {
            "label": "Levantamento garantia",
            "value": "Levantamento garantia"
          },
          {
            "label": "Aprovação de alçadas",
            "value": "Aprovação de alçadas"
          },
          {
            "label": "Garantia",
            "value": "Garantia"
          },
          {
            "label": "Reativação",
            "value": "Reativação"
          },
          {
            "label": "Perícia",
            "value": "Perícia"
          },
          {
            "label": "Acordo",
            "value": "Acordo"
          },
          {
            "label": "Contador",
            "value": "Contador"
          },
          {
            "label": "Decisão",
            "value": "Decisão"
          },
          {
            "label": "Pagamento",
            "value": "Pagamento"
          },
          {
            "label": "Validar Encerramento do Processo",
            "value": "Validar Encerramento do Processo"
          }
        ]
      },
      {
        "key": "title",
        "type": "checkbox",
        "title": "Tipo da tarefa",
        "options": [
          {
            "value": "Advogado interno: Ciência dos cálculos anexados",
            "label": "Advogado interno: Ciência dos cálculos anexados"
          },
          {
            "value": "Agendamento da perícia",
            "label": "Agendamento da perícia"
          },
          {
            "value": "Analisar decisão e atualizar informações do processo",
            "label": "Analisar decisão e atualizar informações do processo"
          },
          {
            "value": "Analisar motivo do não pagamento",
            "label": "Analisar motivo do não pagamento"
          },
          {
            "value": "Analisar Pagamento",
            "label": "Analisar Pagamento"
          },
          {
            "value": "Analisar proposta de acordo",
            "label": "Analisar proposta de acordo"
          },
          {
            "value": "Analisar status do processo",
            "label": "Analisar status do processo"
          },
          {
            "value": "Analisar status processo",
            "label": "Analisar status processo"
          },
          {
            "value": "Anexar comprovantes",
            "label": "Anexar comprovantes"
          },
          {
            "value": "Anexar laudo pericial",
            "label": "Anexar laudo pericial"
          },
          {
            "value": "Apresentar os cálculos",
            "label": "Apresentar os cálculos"
          },
          {
            "value": "Aprovar Pagamento / Garantia",
            "label": "Aprovar Pagamento / Garantia"
          },
          {
            "value": "Aprovar Pagamento / Garantia - Diretoria",
            "label": "Aprovar Pagamento / Garantia - Diretoria"
          },
          {
            "value": "Aprovar Pagamento / Garantia - Gerência",
            "label": "Aprovar Pagamento / Garantia - Gerência"
          },
          {
            "value": "Audiencia agendada",
            "label": "Audiencia agendada"
          },
          {
            "value": "Ciência: Cálculos anexados",
            "label": "Ciência: Cálculos anexados"
          },
          {
            "value": "Ciência Cancelamento do Pagamento",
            "label": "Ciência Cancelamento do Pagamento"
          },
          {
            "value": "Ciência de Acordo Aprovado",
            "label": "Ciência de Acordo Aprovado"
          },
          {
            "value": "Ciência de Acordo Rejeitado",
            "label": "Ciência de Acordo Rejeitado"
          },
          {
            "value": "Ciência de Acordo Reprovado",
            "label": "Ciência de Acordo Reprovado"
          },
          {
            "value": "Ciência de interposição de recurso pela parte contrária",
            "label": "Ciência de interposição de recurso pela parte contrária"
          },
          {
            "value": "Ciência de não interposição de recurso",
            "label": "Ciência de não interposição de recurso"
          },
          {
            "value": "Ciência de pagamento não efetuado",
            "label": "Ciência de pagamento não efetuado"
          },
          {
            "value": "Ciência de perícia agendada",
            "label": "Ciência de perícia agendada"
          },
          {
            "value": "Ciência de Prazo",
            "label": "Ciência de Prazo"
          },
          {
            "value": "Ciencia de preposto designado",
            "label": "Ciencia de preposto designado"
          },
          {
            "value": "Ciência de Reprovação do Pagamento",
            "label": "Ciência de Reprovação do Pagamento"
          },
          {
            "value": "Ciencia de testemunha designada",
            "label": "Ciencia de testemunha designada"
          },
          {
            "value": "Ciência do laudo pericial favorável",
            "label": "Ciência do laudo pericial favorável"
          },
          {
            "value": "Ciência do laudo pericial não favorável",
            "label": "Ciência do laudo pericial não favorável"
          },
          {
            "value": "Ciência intimação/citação",
            "label": "Ciência intimação/citação"
          },
          {
            "value": "Ciência não impugnacão laudo pericial",
            "label": "Ciência não impugnacão laudo pericial"
          },
          {
            "value": "Ciência Nova Comunicação",
            "label": "Ciência Nova Comunicação"
          },
          {
            "value": "Ciência nova OBF",
            "label": "Ciência nova OBF"
          },
          {
            "value": "Complementar documentação para elaboração do cálculo",
            "label": "Complementar documentação para elaboração do cálculo"
          },
          {
            "value": "Complementar Subsídio",
            "label": "Complementar Subsídio"
          },
          {
            "value": "Correção de pendências",
            "label": "Correção de pendências"
          },
          {
            "value": "Decisão Concluída",
            "label": "Decisão Concluída"
          },
          {
            "value": "Efetuar o Pagamento",
            "label": "Efetuar o Pagamento"
          },
          {
            "value": "Elaborar defesa / representação",
            "label": "Elaborar defesa / representação"
          },
          {
            "value": "Elaborar / Disponibilizar subsídio",
            "label": "Elaborar / Disponibilizar subsídio"
          },
          {
            "value": "Encerramento de processo",
            "label": "Encerramento de processo"
          },
          {
            "value": "Escritório: Ciência dos cálculos anexados",
            "label": "Escritório: Ciência dos cálculos anexados"
          },
          {
            "value": "Fornecer Informações Complementares",
            "label": "Fornecer Informações Complementares"
          },
          {
            "value": "Impugnar laudo pericial",
            "label": "Impugnar laudo pericial"
          },
          {
            "value": "Incluir parecer da decisão",
            "label": "Incluir parecer da decisão"
          },
          {
            "value": "Interpor Recurso",
            "label": "Interpor Recurso"
          },
          {
            "value": "Novo processo criado",
            "label": "Novo processo criado"
          },
          {
            "value": "Providenciar Preposto/Testemunha",
            "label": "Providenciar Preposto/Testemunha"
          },
          {
            "value": "Realizar Atendimento OBF",
            "label": "Realizar Atendimento OBF"
          },
          {
            "value": "Realizar Contra-Proposta",
            "label": "Realizar Contra-Proposta"
          },
          {
            "value": "Realizar diligências / Petição intercorrente",
            "label": "Realizar diligências / Petição intercorrente"
          },
          {
            "value": "Reprogramar Pagamento",
            "label": "Reprogramar Pagamento"
          },
          {
            "value": "Resultado Audiencia",
            "label": "Resultado Audiencia"
          },
          {
            "value": "Revisão dos cálculos",
            "label": "Revisão dos cálculos"
          },
          {
            "value": "Revisar Atendimento da OBF",
            "label": "Revisar Atendimento da OBF"
          },
          {
            "value": "Revisar OBF",
            "label": "Revisar OBF"
          },
          {
            "value": "Revisar os cálculos",
            "label": "Revisar os cálculos"
          },
          {
            "value": "Revisar Pagamento",
            "label": "Revisar Pagamento"
          },
          {
            "value": "Seleção de Subsídios",
            "label": "Seleção de Subsídios"
          },
          {
            "value": "Validar Cumprimento da OBF",
            "label": "Validar Cumprimento da OBF"
          },
          {
            "value": "Validar obrigação de fazer",
            "label": "Validar obrigação de fazer"
          },
          {
            "value": "Validar / Solicitar subsídios complementares",
            "label": "Validar / Solicitar subsídios complementares"
          },
          {
            "value": "Verificar comprovante anexo",
            "label": "Verificar comprovante anexo"
          },
          {
            "value": "Verificar preposto e testemunha",
            "label": "Verificar preposto e testemunha"
          }
        ]
      },
      {
        "key": "process.matterId",
        "type": "checkbox",
        "title": "Área do direito",
        "options": [],
        "requestProps": {
          "route": "filters/matter",
          "method": "get",
          "serviceName": "register",
          "functionName": "getFilterOptions"
        }
      },
      {
        "key": "teamId",
        "type": "checkbox",
        "title": "Time responsável",
        "options": [],
        "requestProps": {
          "route": "filters/teams-by-user",
          "method": "get",
          "serviceName": "register",
          "functionName": "getFilterOptions"
        }
      },
      {
        "key": "taskOwnerId",
        "type": "checkbox",
        "title": "Responsável",
        "options": [],
        "requestProps": {
          "route": "get-all-users-by-team/1/100?searchParam=keyword",
          "serviceName": "users",
          "functionName": "getAllUsersInSelect",
          "method": "post"
        },
        "hasSearch": true
      },
      {
        "key": "subsidy.customFields.subsidyType.value",
        "type": "checkbox",
        "title": "Tipo do Subsídio",
        "options": [
          {
            "label": "Solicitar subsídio processual",
            "value": "processual"
          },
          {
            "label": "Solicitar subsídio liminar",
            "value": "liminar"
          },
          {
            "label": "Solicitar subsídio captação",
            "value": "captacao"
          },
          {
            "label": "Solicitar subsídio de apoio jurídico",
            "value": "apoio-juridico"
          }
        ]
      }
    ]
  },
  "subsidy": {
    "fields": [
      {
        "key": "status",
        "type": "checkbox",
        "title": "status",
        "options": [
          {
            "label": "Selecionar",
            "value": "Selecionar"
          },
          {
            "label": "Elaborar",
            "value": "Elaborar"
          },
          {
            "label": "Validar",
            "value": "Validar"
          },
          {
            "label": "Elaborar-Defesa",
            "value": "Elaborar-Defesa"
          },
          {
            "label": "Complementar",
            "value": "Complementar"
          },
          {
            "label": "Concluido",
            "value": "Concluido"
          }
        ]
      }
    ]
  },
  "processDraft": {
    "fields": [
      {
        "key": "createdAt",
        "type": "date",
        "title": "Data de criação",
        "options": [
          {
            "label": "Hoje",
            "value": "today"
          },
          {
            "label": "Ontem",
            "value": "yesterday"
          },
          {
            "label": "Esta semana",
            "value": "thisWeek"
          },
          {
            "label": "Semana passada",
            "value": "lastWeek"
          },
          {
            "label": "Esse mês",
            "value": "thisMonth"
          },
          {
            "label": "Mês passado",
            "value": "lastMonth"
          },
          {
            "label": "Esse ano",
            "value": "thisYear"
          },
          {
            "label": "Ano passado",
            "value": "lastYear"
          }
        ]
      },
      {
        "key": "stateUf.value",
        "type": "checkbox",
        "title": "UF",
        "options": [],
        "requestProps": {
          "route": "filters/state-uf",
          "method": "get",
          "serviceName": "register",
          "functionName": "getFilterOptions"
        }
      },
      {
        "key": "risk.value",
        "type": "checkbox",
        "title": "Risco",
        "options": [
          {
            "label": "Não aplicável",
            "value": "Não aplicável"
          },
          {
            "label": "Possível",
            "value": "Possível"
          },
          {
            "label": "Provável",
            "value": "Provável"
          },
          {
            "label": "Remoto",
            "value": "Remoto"
          }
        ]
      },
      {
        "key": "bpo",
        "type": "checkbox",
        "title": "Processo BPO",
        "options": [
          {
            "label": "Sim",
            "value": true
          },
          {
            "label": "Não",
            "value": false
          }
        ]
      }
    ]
  },
  "payment": {
    "fields": [
      {
        "key": "status",
        "type": "checkbox",
        "title": "status",
        "options": [
          {
            "label": "Analisar",
            "value": "Analisar"
          },
          {
            "label": "Cancelado",
            "value": "Cancelado"
          },
          {
            "label": "Aprovar-Coordenacao",
            "value": "Aprovar-Coordenacao"
          },
          {
            "label": "Aprovar-Gerencia",
            "value": "Aprovar-Gerencia"
          },
          {
            "label": "Aprovar-Diretoria",
            "value": "Aprovar-Diretoria"
          },
          {
            "label": "Pagar",
            "value": "Pagar"
          },
          {
            "label": "Reprovado",
            "value": "Reprovado"
          },
          {
            "label": "Anexar-Comprovantes",
            "value": "Anexar-Comprovantes"
          },
          {
            "label": "Pago",
            "value": "Pago"
          },
          {
            "label": "Rejeitado",
            "value": "Rejeitado"
          },
          {
            "label": "Reprogramar",
            "value": "Reprogramar"
          }
        ]
      }
    ]
  },
  "lawsuitOrders": {
    "fields": [
      {
        "key": "createdAt",
        "type": "date",
        "title": "Data de criação",
        "options": [
          {
            "label": "Hoje",
            "value": "today"
          },
          {
            "label": "Ontem",
            "value": "yesterday"
          },
          {
            "label": "Esta semana",
            "value": "thisWeek"
          },
          {
            "label": "Semana passada",
            "value": "lastWeek"
          },
          {
            "label": "Esse mês",
            "value": "thisMonth"
          },
          {
            "label": "Mês passado",
            "value": "lastMonth"
          },
          {
            "label": "Esse ano",
            "value": "thisYear"
          },
          {
            "label": "Ano passado",
            "value": "lastYear"
          }
        ]
      },
      {
        "key": "risk",
        "type": "checkbox",
        "title": "Risco",
        "options": [
          {
            "label": "Possível",
            "value": "Possível"
          },
          {
            "label": "Provável",
            "value": "Provável"
          },
          {
            "label": "Remoto",
            "value": "Remoto"
          }
        ]
      },
      {
        "key": "instance",
        "type": "checkbox",
        "title": "Instância",
        "options": [
          {
            "label": "Primeira",
            "value": "Primeira"
          },
          {
            "label": "Segunda",
            "value": "Segunda"
          }
        ]
      }
    ]
  },
  "generalValues": {
    "fields": [
      {
        "key": "createdAt",
        "type": "date",
        "minDate": "1 year",
        "title": "Data de criação",
        "options": [
          {
            "label": "3 meses",
            "value": "last90days"
          },
          {
            "label": "6 meses",
            "value": "last180days"
          },
          {
            "label": "1 ano",
            "value": "oneYear"
          }
        ],
        "selected": ""
      },
      {
        "key": "risks",
        "type": "checkbox",
        "title": "Risco",
        "options": [
          {
            "label": "Possível",
            "value": "Possível"
          },
          {
            "label": "Provável",
            "value": "Provável"
          },
          {
            "label": "Remoto",
            "value": "Remoto"
          }
        ],
        "selected": ""
      }
    ]
  },
  "dashboard": {
    "fields": [
      {
        "key": "createdAt",
        "type": "date",
        "title": "Data de criação",
        "options": [
          {
            "label": "Hoje",
            "value": "today"
          },
          {
            "label": "Ontem",
            "value": "yesterday"
          },
          {
            "label": "Esta semana",
            "value": "thisWeek"
          },
          {
            "label": "Semana passada",
            "value": "lastWeek"
          },
          {
            "label": "Esse mês",
            "value": "thisMonth"
          },
          {
            "label": "Mês passado",
            "value": "lastMonth"
          },
          {
            "label": "Esse ano",
            "value": "thisYear"
          },
          {
            "label": "Ano passado",
            "value": "lastYear"
          }
        ]
      },
      {
        "key": "stateUf",
        "type": "checkbox",
        "title": "UF",
        "options": [],
        "requestProps": {
          "route": "filters/state-uf",
          "method": "get",
          "serviceName": "register",
          "functionName": "getFilterOptions"
        }
      },
      {
        "key": "processStatus",
        "type": "checkbox",
        "title": "status",
        "options": [
          {
            "label": "Ativo",
            "value": "Ativo"
          },
          {
            "label": "Encerrado",
            "value": "Encerrado"
          }
        ]
      },
      {
        "key": "processPhase",
        "type": "checkbox",
        "title": "Fase do processo",
        "customFieldsId": "d9e33938-5890-46fc-a5cf-5ce98633dc84",
        "options": []
      },
      {
        "key": "matterId",
        "type": "checkbox",
        "title": "Tipo do processo",
        "options": [],
        "requestProps": {
          "route": "filters/matter",
          "method": "get",
          "serviceName": "register",
          "functionName": "getFilterOptions"
        }
      },
      {
        "key": "internalLawyerId",
        "type": "checkbox",
        "title": "Equipe interna",
        "options": [],
        "requestProps": {
          "route": "filters/teams/3",
          "method": "get",
          "serviceName": "register",
          "functionName": "getFilterOptions"
        }
      },
      {
        "key": "externalLawyerId",
        "type": "checkbox",
        "title": "Equipe externa",
        "options": [],
        "requestProps": {
          "route": "filters/teams/2",
          "method": "get",
          "serviceName": "register",
          "functionName": "getFilterOptions"
        }
      }
    ]
  },
  "generalOrders": {
    "fields": [
      {
        "key": "createdAt",
        "type": "date",
        "title": "Data de criação",
        "options": [
          {
            "label": "Hoje",
            "value": "today"
          },
          {
            "label": "Ontem",
            "value": "yesterday"
          },
          {
            "label": "Esta semana",
            "value": "thisWeek"
          },
          {
            "label": "Semana passada",
            "value": "lastWeek"
          },
          {
            "label": "Esse mês",
            "value": "thisMonth"
          },
          {
            "label": "Mês passado",
            "value": "lastMonth"
          },
          {
            "label": "Esse ano",
            "value": "thisYear"
          },
          {
            "label": "Ano passado",
            "value": "lastYear"
          }
        ]
      },
      {
        "key": "risk",
        "type": "checkbox",
        "title": "Risco",
        "options": [
          {
            "label": "Possível",
            "value": "Possível"
          },
          {
            "label": "Provável",
            "value": "Provável"
          },
          {
            "label": "Remoto",
            "value": "Remoto"
          },
          {
            "label": "Execução",
            "value": "Execução"
          }
        ]
      },
      {
        "key": "instance",
        "type": "checkbox",
        "title": "Instância",
        "options": [
          {
            "label": "Primeira",
            "value": "Primeira"
          },
          {
            "label": "Segunda",
            "value": "Segunda"
          }
        ]
      }
    ]
  },
  "appointments": {
    "fields": [
      {
        "key": "status",
        "type": "checkbox",
        "title": "Status",
        "options": [
          {
            "label": "Agendado",
            "value": "scheduled"
          },
          {
            "label": "Concluído",
            "value": "done"
          },
          {
            "label": "Cancelado",
            "value": "canceled"
          }
        ]
      },
      {
        "key": "appointmentTypeId",
        "type": "checkbox",
        "title": "Tipo de compromisso",
        "options": [],
        "requestProps": {
          "route": "types?search=keyword",
          "method": "get",
          "serviceName": "appointments",
          "functionName": "getFormFieldOptions"
        }
      },
      {
        "key": "createdBy",
        "type": "checkbox",
        "title": "Responsável",
        "options": [],
        "hasSearch": true,
        "requestProps": {
          "route": "get-all-users-by-team/1/100?searchParam=keyword",
          "routeAdmin": "get-all-users/1/100?searchParam=keyword",
          "serviceName": "users",
          "functionName": "getUsersInSelect",
          "functionNameAdmin": "getAllUsersInSelect",
          "method": "post"
        }
      }
    ],
    "search": [
      {
        "key": "title",
        "title": "Título"
      }
    ]
  },
  "calendar": {
    "fields": [
      {
        "key": "status",
        "type": "checkbox",
        "title": "Status",
        "options": [
          {
            "label": "Aguardando ação",
            "value": "Aguardando ação"
          },
          {
            "label": "Aguardando responsável",
            "value": "Aguardando responsável"
          },
          {
            "label": "Aceito",
            "value": "Aceito"
          },
          {
            "label": "Recusado",
            "value": "Recusado"
          },
          {
            "label": "Vencido",
            "value": "Vencido"
          },
          {
            "label": "Finalizado",
            "value": "Finalizado"
          },
          {
            "label": "Arquivado",
            "value": "Arquivado"
          }
        ]
      },
      {
        "key": "teamId",
        "type": "checkbox",
        "title": "Time responsável",
        "options": [],
        "requestProps": {
          "route": "filters/teams-by-user",
          "method": "get",
          "serviceName": "register",
          "functionName": "getFilterOptions"
        }
      },
      {
        "key": "taskOwnerId",
        "type": "checkbox",
        "title": "Responsável",
        "options": [],
        "hasSearch": true,
        "requestProps": {
          "route": "get-all-users-by-team/1/100?searchParam=keyword",
          "routeAdmin": "get-all-users/1/100?searchParam=keyword",
          "serviceName": "users",
          "functionName": "getUsersInSelect",
          "functionNameAdmin": "getAllUsersInSelect",
          "method": "post"
        }
      }
    ],
    "search": [
      {
        "key": "searchParam",
        "title": "Busca (título/descrição/processo)"
      }
    ]
  }
}