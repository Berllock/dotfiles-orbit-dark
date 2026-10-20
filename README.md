# Dotfiles Orbit Dark

My personal Fedora/GNOME development environment configuration.

## Stack

- Fedora Workstation
- GNOME
- Zsh
- Starship
- Kitty
- Tokyo Night
- Fastfetch
- eza
- bat
- btop
- zoxide
- fzf
- NVM for Node.js/npm and Angular CLI
- asdf >= 0.16 for Java and other runtimes

## Restore

```bash
git clone <repo-url>
cd dotfiles-orbit-dark
./install.sh
```

The installer copies Zsh, Starship, Kitty and Fastfetch configuration. It
preserves existing files in a new `~/.orbit-dark-backup.*` directory on every
run, respects `XDG_CONFIG_HOME` and can be invoked from any working directory.
It does not install packages or change GNOME settings.

Install Oh My Zsh and Starship before restoring. The Zsh configuration expects
asdf >= 0.16 as a standalone executable in PATH, with shims in
`${ASDF_DATA_DIR:-$HOME/.asdf}/shims`; it does not load the legacy `asdf.sh`.
Node/npm are managed by NVM in `~/.nvm`, loaded after the asdf PATH setup.
Do not configure a custom npm `prefix` or add `~/.npm-global/bin` to PATH:
global packages belong to the active NVM Node version. Angular CLI can be
installed with `npm install -g @angular/cli` after selecting a compatible Node
version. Use `nvm install` / `nvm use` in projects that have a `.nvmrc`.
Use asdf for Java and other runtimes; do not add the asdf Node.js plugin.

Official installation instructions:
- https://github.com/nvm-sh/nvm#installing-and-updating
- https://asdf-vm.com/guide/getting-started.html

After restoring, open a new Zsh terminal or run `source ~/.zshrc` from Zsh.
Kitty requests JetBrainsMono Nerd Font Mono; install that font separately
for the prompt and eza icons.
