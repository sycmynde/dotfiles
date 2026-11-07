#!/usr/bin/env bash
# Install dotfiles: symlink repo files to home dir
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOME_DIR="${HOME:-/root}"

link() {
    local src="$DOTFILES_DIR/$1"
    local dst="$HOME_DIR/$2"
    if [ -e "$dst" ] && [ ! -L "$dst" ]; then
        mv "$dst" "$dst.bak.$(date +%s)"
        echo "backed up: $dst"
    fi
    ln -sf "$src" "$dst"
    echo "linked: $dst -> $src"
}

link bashrc .bashrc
link gitconfig .gitconfig
# link tmux.conf .tmux.conf   # uncomment when added

echo "Done. Reload shell: exec bash"
