# Guia do feat: como trabalhar com features no Zed

O `feat` organiza o trabalho **por feature**. Cada feature ganha uma pasta própria com uma cópia (git worktree) de cada repo envolvido, todas na mesma branch. Cada feature abre numa janela do Zed, e os serviços dela rodam juntos num painel só.

```
~/features/
├── ERP-1036/                 ← uma janela do Zed
│   ├── lexxy-models/         ← worktree na branch feature/ERP-1036
│   ├── lexxy-tasks/          ← worktree na branch feature/ERP-1036
│   └── .feat/                ← controle interno (não precisa mexer)
└── ERP-1091/                 ← outra janela do Zed
    └── lexxy-register/       ← worktree na branch fix/ERP-1091
```

Os repos principais em `~/Development/Lexxy` **não mudam de branch**. Eles continuam na `develop`, e cada feature trabalha na própria pasta.

> Primeira vez nesta máquina? Faça a instalação do [`__info.md`](./__info.md) e confira com `feat doctor`.

---

## Os 4 atalhos que importam

| Atalho | O que faz |
|---|---|
| **`Alt+Shift+F`** | **Menu do feat**: lista tudo o que dá para fazer. Na dúvida, use este. |
| `Alt+Shift+N` | Criar uma feature nova |
| `Alt+Shift+U` | Rodar os serviços da feature desta janela |
| `Alt+Shift+D` | Parar os serviços |

Os atalhos são combinações: aperte as três teclas juntas e solte. Eles funcionam em qualquer janela do Zed, mesmo sem pasta aberta.

Sem atalho, também dá para usar o Zed: `Alt+Shift+T` (ou `Ctrl+Shift+P` → `task: spawn`), digite `feat` e escolha. No terminal, use `feat <comando>`.

---

## Passo a passo: criar uma feature nova

Exemplo: a ERP-1036 precisa mexer em `lexxy-models` e `lexxy-tasks`.

1. **Abra o Zed**, em qualquer janela.
2. **Aperte `Alt+Shift+N`.** Um terminal abre embaixo.
3. **Digite o número do card** (`1036`) e aperte `Enter`. O `ERP-` entra sozinho.
4. A pergunta **"É fix?"** aparece. Aperte `Enter` para "não" (branch `feature/ERP-1036`), ou `s` para fix (branch `fix/ERP-1036`).
5. **Escolha os repos** na lista que abre:
   - digite parte do nome (`models`) e aperte **`Tab`** para marcar;
   - digite outro (`tasks`) e aperte **`Tab`**;
   - aperte **`Enter`** para confirmar (`Esc` cancela).
6. **Aguarde.** O `feat` faz isto sozinho:
   - atualiza os repos (`git fetch`);
   - cria a pasta `~/features/ERP-1036` com uma worktree por repo, na branch `feature/ERP-1036`, partindo da `develop` atualizada. Se a branch já existir, no seu computador ou no GitHub, ele usa a existente;
   - copia o `.env` de cada repo;
   - roda `npm ci` (ou `bun install`) em todos ao mesmo tempo.
7. **Uma janela nova do Zed abre** com a feature. Trabalhe nela normalmente. O painel de arquivos mostra os repos lado a lado, e o painel git mostra as mudanças de cada um.
8. **Para subir os serviços, aperte `Alt+Shift+U`.** Um painel abre no centro com todos os serviços da feature rodando (veja [O painel de serviços](#o-painel-de-serviços-mprocs)).

O mesmo pelo terminal, num comando só:

```sh
feat new 1036 models tasks          # feature/ERP-1036
feat new 1091 register --fix        # fix/ERP-1091
```

### Esqueci um repo

Na janela da feature, abra o menu (`Alt+Shift+F`) → **add** e escolha o repo. Ou no terminal: `feat add flows`. Se os serviços estiverem rodando, aperte `Alt+Shift+U` de novo para incluir o novo.

---

## Trocar de feature

Você estava na ERP-1036 com os serviços rodando e precisa mexer na ERP-1091:

1. `Alt+Shift+F` → **open** e escolha `ERP-1091`. A lista mostra uma prévia do status de cada feature. Se a janela dela já estiver aberta, é só ir até ela.
2. Na janela da ERP-1091, aperte **`Alt+Shift+U`**.

Só isso. O `feat` **para sozinho** os serviços da ERP-1036 e sobe os da ERP-1091. Ele também libera as portas (3001, 3004...) se algum processo antigo estiver preso nelas.

Para voltar, faça o mesmo na janela da ERP-1036. O `Ctrl+R` (projetos recentes do Zed) também lista as features.

---

## O painel de serviços (mprocs)

O `Alt+Shift+U` abre um painel com a lista de serviços à esquerda e o log do serviço selecionado à direita.

| Tecla | Ação |
|---|---|
| `↑` `↓` | escolher o serviço |
| `r` | reiniciar o serviço |
| `x` | parar o serviço |
| `s` | subir o serviço |
| `z` | log em tela cheia (e volta) |
| `Ctrl+A` | entra e sai do terminal do serviço, para digitar nele (por exemplo, responder as perguntas do `npm run dev` do web-app) |
| `q` | sair, parando tudo (ou use `Alt+Shift+D` de qualquer janela) |

Repos sem script `dev` ou `start` (como o `lexxy-models`) não aparecem no painel.

---

## Commit, push e PR

Use o painel git do Zed (`Ctrl+Shift+Q`) ou o terminal dentro da pasta do repo. Cada repo da feature é um repo git normal.

- **Primeiro push** de uma branch nova: `git push -u origin HEAD`. A branch nasce sem vínculo com o remoto, para um `git pull` nunca puxar a `develop` por engano.
- **Ver como está tudo**: `Alt+Shift+F` → **status**. Mostra em cada repo se há arquivos alterados (`●`), commits não enviados (`↑`), commits para puxar (`↓`) e quanto a `develop` andou desde que você começou.
- **A develop andou e você quer trazer as mudanças**: `Alt+Shift+F` → **sync**. Faz merge da `develop` em todos os repos da feature. Repos com alteração não commitada são pulados. Se houver conflito, ele avisa em qual repo.

---

## Terminar uma feature

Depois do merge da PR:

```sh
feat rm 1036 --delete-branch
```

O comando apaga a pasta da feature e as worktrees. Com `--delete-branch`, apaga também a branch local, mas só se ela já foi mergeada. **Ele recusa** se algum repo tiver alteração não commitada ou commit não enviado, e mostra o que é. Com `--force`, remove mesmo assim e **perde essas alterações**.

---

## Referência de comandos

Onde o comando pede `[id]`, você pode passar o ID (`1036` ou `ERP-1036`). Se não passar, ele usa a feature da pasta atual ou mostra uma lista para escolher.

| Comando | O que faz | Opções |
|---|---|---|
| `feat menu` | Menu com as ações. As opções mudam conforme você está ou não dentro de uma feature. | |
| `feat new [id] [repos…]` | Cria a feature, ou adiciona repos se ela já existir. Sem argumentos, pergunta tudo. | `--fix` branch `fix/…` · `--base X` parte de outra branch · `--move` traz uma worktree que já existe (por exemplo, do Orca) · `--no-install` não instala dependências · `--no-open` não abre o Zed |
| `feat add [repos…]` | Adiciona repos à feature atual | `-f <id>` escolhe a feature · `--move` · `--no-install` |
| `feat open [id]` | Abre a feature numa janela nova | |
| `feat up [id]` | Para o que estiver rodando e sobe os serviços desta feature | |
| `feat down` | Para os serviços que estão rodando | |
| `feat status [id]` | Situação de cada repo. Fora de uma feature, mostra todas. | |
| `feat ls` | Lista as features (`▶` = rodando) | |
| `feat sync [id]` | Traz a base (`develop`) para todos os repos | |
| `feat rm [id]` | Remove a feature com segurança | `--delete-branch` · `--force` · `-y` não pergunta |
| `feat repos` | Lista os repos que o `feat` encontrou | |
| `feat doctor` | Confere se está tudo instalado e configurado | |
| `fcd [id] [repo]` | (zsh) Entra na pasta da feature ou de um repo dela: `fcd 1036 tasks` | |

**Nomes de repo aceitam trecho**: `tasks` = `lexxy-tasks`, `buser` = `lexxy-buser-flow`. Se o trecho servir para mais de um repo, o `feat` avisa. O `Tab` do zsh completa comandos, repos e features.

---

## Situações comuns

| Situação | O que fazer |
|---|---|
| "feature/ERP-1036 já está em uso em ~/orca/…" | A branch está numa worktree antiga. Use `feat new 1036 <repo> --move` para trazê-la, junto com `node_modules` e `.env`. |
| "está em uso no repo principal" | O repo principal em `~/Development/Lexxy` está nessa branch. Volte ele para a `develop`. |
| Um serviço não sobe | Selecione o serviço no painel e leia o log. Se o problema for o `.env`, edite o arquivo dentro da pasta da feature. |
| Falhou ao instalar dependências | O log fica em `~/features/<ID>/.feat/logs/install-<repo>.log`. Rode `npm i` na pasta do repo. |
| O repo precisa de outro comando ou de outra base | Adicione uma linha no `~/.config/feat/lexxy/repos.conf` (veja o [`__info.md`](./__info.md)). |
| A feature precisa de um `.env` diferente do repo principal | Crie um template em `~/.local/share/feat/lexxy/env/<repo>/.env` antes de criar a feature, ou edite o `.env` da pasta da feature. |
| Porta ocupada | O `feat up` já mata o que estiver na porta. Fora dele, use `feat down`. |
