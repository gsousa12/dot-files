# Mostra qual conta do git vale na pasta atual (commit + push)
gitwho() {
  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "⚠️  Fora de um repo git: o includeIf não vale aqui."
    echo "   Usuário global: $(git config user.name) <$(git config user.email)>"
    return 1
  fi
  local name email cred origin remote
  name=$(git config user.name)
  email=$(git config user.email)
  cred=$(git config credential.https://github.com.username)
  origin=$(git config --show-origin user.email | cut -f1 | sed 's/^file://')
  remote=$(git remote get-url origin 2>/dev/null)
  echo "📁 Repo:    $(git rev-parse --show-toplevel)"
  echo "👤 Commit:  $name <$email>"
  echo "🔑 Push:    ${cred:-⚠️  indefinido (usa o 1º token do ~/.git-credentials)}"
  echo "⚙️  Config:  $origin"
  [[ -n $remote ]] && echo "🌐 Remote:  $remote"
}
