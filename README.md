# Configs

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Layout

Each top-level directory is a Stow package. Files inside mirror `$HOME`:

```
zsh/       → ~/.zshrc
git/       → ~/.gitconfig
starship/  → ~/.config/starship.toml
tmux/      → ~/.tmux.conf
alacritty/ → ~/.config/alacritty/alacritty.toml
```

`vscode-settings.json` is kept in the repo for reference but is not deployed by Stow. Copy or link it manually:

```sh
mkdir -p ~/.config/Code/User
ln -sf "$(pwd)/vscode-settings.json" ~/.config/Code/User/settings.json
```

## Usage

```sh
# Symlink all packages into $HOME
make install

# Preview what would be linked
make status

# Remove symlinks
make uninstall
```

Install a subset:

```sh
stow -t ~ zsh git
```

After editing `.zshrc`, reload with `s` or `source ~/.zshrc`.

### Tmux

Uses [TPM](https://github.com/tmux-plugins/tpm) with `tmux-sensible` and [Catppuccin](https://github.com/catppuccin/tmux) (mocha). After `make install`, start tmux and press `prefix + I` to install plugins.

### Alacritty

Uses JetBrainsMono Nerd Font Mono. Alacritty falls back to the terminal default colors (no imported theme).
