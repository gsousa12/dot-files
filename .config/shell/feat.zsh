# Integração do feat com o zsh: autocomplete + fcd (cd para uma feature).
(( $+commands[feat] )) || return

_feat() {
  local -a cmds
  cmds=(
    'new:cria/expande uma feature' 'add:adiciona repos à feature atual' 'open:abre no Zed'
    'up:para a que roda e sobe esta' 'down:para tudo' 'status:estado dos repos' 'ls:lista features'
    'sync:traz a base para a feature' 'rm:remove a feature' 'repos:repos do perfil' 'doctor:checa o setup' 'menu:menu de ações'
  )
  if (( CURRENT == 2 )); then _describe 'comando' cmds; return; fi
  case $words[2] in
    new) (( CURRENT == 3 )) && { compadd -- ${(f)"$(feat _complete features)"}; return; }
         compadd -- --fix --base --move --no-install --no-open ${(f)"$(feat _complete repos)"} ;;
    add) compadd -- --move -f ${(f)"$(feat _complete repos)"} ;;
    open|up|status|st|sync) compadd -- ${(f)"$(feat _complete features)"} ;;
    rm) compadd -- --delete-branch --force -y ${(f)"$(feat _complete features)"} ;;
  esac
}
compdef _feat feat

# fcd            -> escolhe a feature no fzf e entra nela
# fcd 1036 tasks -> entra em ~/features/ERP-1036/lexxy-tasks (trecho do nome serve)
fcd() {
  local dir sub
  if [[ -z $1 ]]; then dir=$(feat _pick) || return
  else dir=$(feat _pick-dir "$1") || return; fi
  if [[ -n $2 ]]; then sub=( $dir/*$2*(N/) ); (( $#sub )) && dir=$sub[1]; fi
  cd -- "$dir"
}
