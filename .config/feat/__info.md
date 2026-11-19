# feat: uma pasta por feature, com uma worktree por repo

O `feat` cria as worktrees de uma feature em vários repos de uma vez, todas na mesma branch. Ele copia o `.env`, instala as dependências e abre a feature numa janela própria do Zed. Os serviços da feature rodam juntos no `mprocs`, e trocar de feature para tudo o que estava rodando antes.

```
~/features/ERP-1036/            ← uma janela do Zed
├── lexxy-models/               ← git worktree, branch feature/ERP-1036
├── lexxy-tasks/
└── .feat/                      ← metadados (feature.conf, repos, mprocs.yaml, logs)
```

## Instalar

```sh
~/Pessoal/dot-files/.config/feat/install.sh --mprocs   # links + baixa o mprocs 0.9.6
exec zsh
feat doctor
```

O `install.sh` cria três links: `~/.local/bin/feat`, `~/.config/feat` e `~/.config/shell/feat.zsh`. O `.zshrc` carrega o `feat.zsh`. As tasks e os atalhos do Zed ficam em [`../zed`](../zed/__info.md).

## Uso no dia a dia

O **[GUIA.md](./GUIA.md)** tem o passo a passo (criar, trocar, terminar feature) e a referência de todos os comandos. Resumo:

| Atalho no Zed | Comando |
|---|---|
| `Alt+Shift+F` | `feat menu`: menu com todas as ações |
| `Alt+Shift+N` | `feat new`: nova feature |
| `Alt+Shift+U` | `feat up`: para o que estiver rodando e sobe esta feature |
| `Alt+Shift+D` | `feat down`: para tudo |

## Configurar

Cada projeto ou emprego é um **perfil** em `~/.config/feat/<perfil>/`. O perfil ativo é o de [`default-profile`](./default-profile), ou o da variável `FEAT_PROFILE`.

- [`lexxy/project.conf`](./lexxy/project.conf): onde ficam os repos, a pasta das features, o prefixo do ID, os prefixos de branch, a base padrão e a estratégia do sync.
- [`lexxy/repos.conf`](./lexxy/repos.conf): **só as exceções**, uma por linha: `repo | base | run`.

Sem exceção, o `feat` decide sozinho:

- **Base**: `develop`. Se o repo não tem `origin/develop`, usa a branch padrão do remoto (`main`).
- **Comando**: `<pm> run dev`, se não houver usa `<pm> run start`, e se não houver nenhum dos dois o repo não sobe. O `<pm>` vem do lockfile (npm, bun, pnpm ou yarn).
- **Versão do Node**: se o repo tiver `.nvmrc`, o `feat` respeita via nvm.

### `.env`

Por padrão, o `feat` copia os `.env*` do repo principal para a worktree, menos os `.example`. Para valores diferentes só nas features, crie um template:

```
~/.local/share/feat/lexxy/env/<repo>/.env    ← tem prioridade sobre o do repo principal
```

Arquivos que já existem na worktree nunca são sobrescritos. **Essa pasta fica fora do git de propósito, porque contém segredos.** Para levar a outra máquina, copie-a à mão ou guarde num gerenciador de senhas.

### Novo projeto ou emprego

```sh
cp -r ~/.config/feat/lexxy ~/.config/feat/novo   # ajuste project.conf e repos.conf
echo novo > ~/.config/feat/default-profile
```

## Bom saber

- **Uma feature roda por vez.** O `feat up` lembra qual está rodando (em `~/.local/state/feat/running`). Antes de subir, ele encerra o mprocs anterior com todos os processos filhos. Também mata o que estiver escutando nas portas (`PORT=`) dos `.env` da feature, como sobras do Orca ou um processo zumbi.
- **A identidade git de trabalho continua valendo** em `~/features`. O `includeIf "gitdir:~/Development/"` olha para o `.git` do repo principal, que continua em `~/Development`.
- **Branch nova não tem upstream** (é criada com `--no-track`), para o `git pull` nunca puxar a `develop` por engano. No primeiro push, use `git push -u origin HEAD`.
- **Para customizar com a ajuda de uma LLM**, aponte para o [`AGENTS.md`](./AGENTS.md).
