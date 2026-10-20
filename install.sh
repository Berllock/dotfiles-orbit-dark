#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"
BACKUP_DIR="$(mktemp -d "$HOME/.orbit-dark-backup.XXXXXXXX")"

echo "Backing up current files to $BACKUP_DIR..."

backup() {
    local source="$1" name="$2"
    if [[ -e "$source" || -L "$source" ]]; then
        cp -a -- "$source" "$BACKUP_DIR/$name"
    fi
}

backup "$HOME/.zshrc" zshrc
backup "$CONFIG_DIR/starship.toml" starship.toml
backup "$CONFIG_DIR/kitty" kitty
backup "$CONFIG_DIR/fastfetch" fastfetch

echo "Installing dotfiles..."

mkdir -p -- "$CONFIG_DIR/kitty" "$CONFIG_DIR/fastfetch"
cp -- "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
cp -- "$DOTFILES_DIR/config/starship.toml" "$CONFIG_DIR/starship.toml"
cp -R -- "$DOTFILES_DIR/config/kitty/." "$CONFIG_DIR/kitty/"
cp -R -- "$DOTFILES_DIR/config/fastfetch/." "$CONFIG_DIR/fastfetch/"

echo "Done."
echo "Backups: $BACKUP_DIR"
echo "Open a new Zsh terminal or, from Zsh, run: source ~/.zshrc"
