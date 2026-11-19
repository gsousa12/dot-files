# Função `gitwho`

O arquivo [`gitwho.sh`](./gitwho.sh) define uma função que mostra a identidade usada nos commits, o usuário configurado para o GitHub, a origem da configuração do e-mail e a URL do remoto `origin`.

## Carregar no Zsh

O [`.zshrc` deste repositório](../../zsh/.zshrc) carrega a função automaticamente de `~/.config/shell/gitwho.sh`. Se já houver um arquivo nesse caminho, mova-o para um backup antes de criar o link.

```sh
repo="$HOME/Pessoal/dot-files"
mkdir -p -- "$HOME/.config/shell"
ln -sT -- "$repo/.config/shell/gitwho.sh" "$HOME/.config/shell/gitwho.sh"
```

Abra um novo Zsh ou rode `source ~/.config/shell/gitwho.sh` na sessão atual. Entre em um repositório Git e rode `gitwho`.
