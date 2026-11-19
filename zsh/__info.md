# Zsh, Oh My Zsh e Powerlevel10k

- [`.zshrc`](./.zshrc) define o `PATH`, o histórico e os plugins do Oh My Zsh. Altere a lista `plugins=(...)` para escolher quais plugins carregar.
- [`.p10k.zsh`](./.p10k.zsh) controla os segmentos, as cores e os ícones do prompt do Powerlevel10k.

## Ativar no Linux

Instale o Zsh e tenha o Oh My Zsh em `~/.oh-my-zsh`. Para usar o Powerlevel10k, instale o tema em `${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k`. Quando o tema está ausente, o `.zshrc` usa `robbyrussell`.

Se já houver arquivos nos caminhos de destino, guarde uma cópia e mova os originais antes de criar os links. Se os links já estiverem ativos, edite os arquivos nesta pasta.

```sh
repo="$HOME/Pessoal/dot-files"
ln -sT -- "$repo/zsh/.zshrc" "${ZDOTDIR:-$HOME}/.zshrc"
ln -sT -- "$repo/zsh/.p10k.zsh" "$HOME/.p10k.zsh"
```

Abra uma nova sessão com `exec zsh` para aplicar as alterações. Para ativar a função `gitwho`, siga o [guia das funções do shell](../.config/shell/__info.md).
