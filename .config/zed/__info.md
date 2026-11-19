# Zed

- [`settings.json`](./settings.json) contém as preferências globais do editor.
- [`keymap.json`](./keymap.json) configura os atalhos de teclado.
- [`tasks.json`](./tasks.json) define a tarefa para abrir um terminal externo na pasta do arquivo atual.
- [`settings_backup.json`](./settings_backup.json) guarda uma versão anterior das preferências que você pode comparar com `settings.json` ou usar para restaurá-las.

## Aplicar no Linux

Faça uma cópia de segurança das configurações existentes antes de instalar as versões do repositório. `cp -i` pede confirmação antes de sobrescrever um arquivo.

```sh
repo="$HOME/Pessoal/dot-files"
zed_dir="${XDG_CONFIG_HOME:-$HOME/.config}/zed"
mkdir -p -- "$zed_dir"
cp -i -- "$repo/.config/zed/settings.json" "$repo/.config/zed/keymap.json" \
  "$repo/.config/zed/tasks.json" "$zed_dir/"
```

Para rodar a tarefa, use `Ctrl+Alt+Shift+T` ou procure `task: spawn` na paleta de comandos e selecione **Abrir terminal externo na pasta do arquivo**. A tarefa depende do executável `/home/gabriel/.local/bin/zed-open-external-terminal`. Em outra máquina, ajuste `command` no `tasks.json` ativo para apontar para o caminho do seu executável. [Documentação de tarefas do Zed](https://zed.dev/docs/tasks)

Para restaurar o backup, copie `settings_backup.json` para a pasta de configuração do Zed com o nome `settings.json`.
