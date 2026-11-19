# Ghostty

O arquivo [`config`](./config) define a fonte e seu tamanho, o espaçamento da janela, a opacidade, o cursor, a integração com o shell e as permissões da área de transferência. Para ajustar a aparência, edite as linhas `chave = valor`, como `font-size = 13`.

## Ativar no Linux

Com o Ghostty instalado, mova qualquer configuração anterior para um backup antes de criar o link. Se o link já estiver ativo, edite `config` nesta pasta.

```sh
repo="$HOME/Pessoal/dot-files"
ghostty_dir="${XDG_CONFIG_HOME:-$HOME/.config}/ghostty"
mkdir -p -- "$ghostty_dir"
ln -sT -- "$repo/.config/ghostty/config" "$ghostty_dir/config"
ghostty +validate-config
```

Depois de validar, reinicie o Ghostty para aplicar as alterações.
