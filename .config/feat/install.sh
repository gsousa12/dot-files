#!/usr/bin/env bash
# Instala o feat a partir do repo de dotfiles (symlinks) e, com --mprocs, baixa o mprocs.
set -euo pipefail
repo="$(cd "$(dirname "$(readlink -f "$0")")/../.." && pwd)"
cfg="${XDG_CONFIG_HOME:-$HOME/.config}"
MPROCS_VERSION=0.9.6   # 0.10+ virou "dekit" com outro formato de config

link() { # link <origem> <destino>; guarda backup se já houver arquivo real
  if [[ -e $2 && ! -L $2 ]]; then mv -- "$2" "$2.bak.$(date +%s)"; echo "backup: $2.bak.*"; fi
  mkdir -p -- "$(dirname "$2")"; ln -sfnT -- "$1" "$2"; echo "link: $2 -> $1"
}

link "$repo/.local/bin/feat"          "$HOME/.local/bin/feat"
link "$repo/.config/feat"             "$cfg/feat"
link "$repo/.config/shell/feat.zsh"   "$cfg/shell/feat.zsh"
chmod +x "$repo/.local/bin/feat"

if [[ ${1:-} == --mprocs ]]; then
  case $(uname -s)-$(uname -m) in
    Linux-x86_64) asset=linux-x86_64-musl ;; Linux-aarch64) asset=linux-aarch64-musl ;;
    Darwin-arm64) asset=darwin-aarch64 ;; Darwin-x86_64) asset=darwin-x86_64 ;;
    *) echo "plataforma não suportada"; exit 1 ;;
  esac
  tmp=$(mktemp -d); trap 'rm -rf "$tmp"' EXIT
  curl -fsSL -o "$tmp/m.tgz" "https://github.com/pvolok/dekit/releases/download/v$MPROCS_VERSION/mprocs-$MPROCS_VERSION-$asset.tar.gz"
  tar -xzf "$tmp/m.tgz" -C "$tmp"
  install -m755 "$tmp/mprocs" "$HOME/.local/bin/mprocs"
  "$HOME/.local/bin/mprocs" --version
fi
echo "ok. Abra um novo zsh (exec zsh) e rode: feat doctor"
