#!/usr/bin/env bash

set -e

echo "Creating config directories..."

mkdir -p ~/.config/kitty
mkdir -p ~/.config/fastfetch

echo "Backing up current files..."

[ -f ~/.zshrc ] && cp ~/.zshrc ~/.zshrc.bak
[ -f ~/.config/starship.toml ] && cp ~/.config/starship.toml ~/.config/starship.toml.bak
[ -d ~/.config/kitty ] && cp -r ~/.config/kitty ~/.config/kitty.bak
[ -d ~/.config/fastfetch ] && cp -r ~/.config/fastfetch ~/.config/fastfetch.bak

echo "Installing dotfiles..."

cp .zshrc ~/.zshrc
cp config/starship.toml ~/.config/starship.toml
cp -r config/kitty/* ~/.config/kitty/ 2>/dev/null || true
cp -r config/fastfetch/* ~/.config/fastfetch/ 2>/dev/null || true

echo "Done."
echo "Restart your terminal or run: source ~/.zshrc"
