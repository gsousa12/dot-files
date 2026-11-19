# Configurações em `.config`

- [Ghostty](./ghostty/__info.md) explica como ativar e validar a configuração do terminal.
- [Funções do shell](./shell/__info.md) mostra como carregar e usar `gitwho` no Zsh.
- [Zed](./zed/__info.md) explica como instalar as preferências, os atalhos e as tarefas do editor.

No Linux, os guias do Ghostty e do Zed usam `${XDG_CONFIG_HOME:-$HOME/.config}` como pasta de configuração. O `.zshrc` desta coleção carrega a função `gitwho` de `~/.config/shell/gitwho.sh`.
