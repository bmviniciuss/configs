# Configs

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Layout

Each top-level directory is a Stow package. Files inside mirror `$HOME`:

```
zsh/       → ~/.zshrc, ~/.zsh/{general,zinit,aliases,functions,config}.zsh
git/       → ~/.gitconfig
starship/  → ~/.config/starship.toml
tmux/      → ~/.tmux.conf
alacritty/ → ~/.config/alacritty/{alacritty.toml,catppuccin-mocha.toml}
nvim/      → ~/.config/nvim (LazyVim starter)
```

`vscode-settings.json` is kept in the repo for reference but is not deployed by Stow. Copy or link it manually:

```sh
mkdir -p ~/.config/Code/User
ln -sf "$(pwd)/vscode-settings.json" ~/.config/Code/User/settings.json
```

### Zsh modules

| File | Purpose |
|------|---------|
| `general.zsh` | PATH and environment exports |
| `zinit.zsh` | [Zinit](https://github.com/zdharma-continuum/zinit) bootstrap and completion |
| `aliases.zsh` | Shell aliases |
| `functions.zsh` | Shell functions |
| `config.zsh` | History, plugins, prompt, toolchains |

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

After editing zsh modules, reload with `s` or `source ~/.zshrc`.

### Tmux

Uses [TPM](https://github.com/tmux-plugins/tpm) with `tmux-sensible` and [Catppuccin](https://github.com/catppuccin/tmux) (mocha). After `make install`, start tmux and press `prefix + I` to install plugins.

### Neovim (LazyVim)

Based on the [LazyVim starter](https://github.com/LazyVim/starter). If you already have Neovim config, back it up first ([LazyVim install guide](https://www.lazyvim.org/installation)):

```sh
mv ~/.config/nvim{,.bak}
mv ~/.local/share/nvim{,.bak}    # optional
mv ~/.local/state/nvim{,.bak}    # optional
mv ~/.cache/nvim{,.bak}          # optional
```

Then `make install`, run `nvim` once to bootstrap plugins, and `:LazyHealth` to verify.

Customize in `nvim/.config/nvim/lua/` (see comments in `plugins/example.lua`).

### Alacritty

Uses [Catppuccin mocha](https://github.com/catppuccin/alacritty) via `general.import`. Theme file is vendored from upstream; update with:

```sh
curl -LO --output-dir alacritty/.config/alacritty \
  https://github.com/catppuccin/alacritty/raw/main/catppuccin-mocha.toml
```
