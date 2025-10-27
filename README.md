# Dotfiles

Personal macOS dotfiles and a bootstrap script for a repeatable developer environment.

## Highlights
- Automates Homebrew installation and keeps core packages, terminal tools, and fonts in sync.
- Installs Oh My Zsh, configures plugins, and applies shell, tmux, Neovim, Ghostty, Starship, and other dotfiles.
- Uses GNU Stow with `--restow` so existing symlinks and configs are refreshed safely.
- Creates timestamped backups of existing configuration files before linking anything new.

## Requirements
- macOS (the script aborts on other platforms)
- Git, curl, and xcode-select command line tools (installed automatically by macOS when missing)
- Homebrew is optional—the script installs it if absent.

## Quick Start
1. Clone or download this repository into `~/dotfiles` (or any directory you prefer).
2. Ensure the script is executable: `chmod +x setup.sh`.
3. Run the bootstrap: `./setup.sh`.

The script will:
- Verify macOS, install Homebrew if needed, and tap required formula sources.
- Install command-line packages like `zsh-autosuggestions`, `fzf`, `ripgrep`, `neovim`, `tmux`, `starship`, and more.
- Install GUI applications and fonts such as Ghostty and Nerd Fonts via Homebrew casks.
- Install Oh My Zsh, configure shell defaults, and restow dotfiles into your home directory.
- Run any final setup tasks (for example, initializing `conda` when available).

When symlinking, existing files are backed up under `~/.config_backup_<timestamp>` and then replaced with links created via `stow --restow --target="$HOME"`.

## Managing Dotfiles Manually
If you want to apply only part of the configuration, run GNU Stow directly from the repo root:

```bash
stow --restow <dir>
```

Examples:
- `stow --restow zsh` to refresh shell configuration.
- `stow --restow nvim` to link the LazyVim-inspired Neovim setup.
- `stow --restow ghostty` to apply the Ghostty configuration.

Remove a component by unstowing it:

```bash
stow --delete <dir>
```

## Repository Layout
- `setup.sh` – macOS bootstrap script outlined above.
- `zsh/` – Z shell configuration (`.zshrc`, custom functions, and plugin hooks).
- `bash/` – Bash profile configuration.
- `tmux/` – tmux configuration files.
- `nvim/` – Neovim setup (LazyVim-based plus legacy config support).
- `ghostty/` – Ghostty terminal preferences.
- `wezterm/` – WezTerm configuration.
- `starship/` – Starship prompt configuration.
- `git/` – Global Git configuration templates.
- `vim/` – Legacy Vim configuration.
- `aerospace/`, `karabiner/`, `ohmyposh-themes/`, etc. – Additional app and tooling configs ready to stow.

## Neovim Notes
- LazyVim handles most plugin management, but an older `init.lua` path is also available if you prefer the custom configuration.
- macOS users may need to raise file descriptor limits for plugins like gitsigns:
  ```bash
  sudo launchctl limit maxfiles 65536 200000
  launchctl limit maxfiles
  ```
- Python tooling: `pip install pydocstyle python-lsp-server pyls-flake8`.
- Create the undo directory if you rely on persistent undo: `mkdir -p ~/.config/nvim/undodir`.

## Karabiner
To use the Karabiner setup, copy `karabiner/.config/karabiner` to `~/.config/karabiner/` or restow the directory: `stow --restow karabiner`.

## Updating Packages
Re-running `./setup.sh` is safe; it reruns the package install checks and restows configs. Homebrew handles upgrades with `brew upgrade`, which you should run periodically to pull in new versions.

## Troubleshooting
- If you prefer a different default shell, update `setup.sh` before running it; by default it switches to `zsh`.
- When stow reports conflicts, check `~/.config_backup_*` for your previous files.
- For new machines without developer tools, running the script may prompt the macOS Command Line Tools installer—complete it and rerun the script.
