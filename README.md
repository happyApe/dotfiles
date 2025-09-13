## Dotfiles Setup

This repository contains my personal dotfiles and a setup script for macOS development environment.

### Quick Setup

Run the setup script to install everything:

```bash
./setup.sh
```

This will install:
- Homebrew and essential packages
- Oh My Zsh
- Terminal emulators (Ghostty, WezTerm)
- Development tools (Node.js, Neovim, tmux, etc.)
- Fonts and UI applications
- Dotfiles configuration via GNU Stow

### Manual Usage with Stow

If you prefer manual setup:

```bash
stow <dir_name>
```
This will create a symlink at appropriate place for the respective dotfile

### LazyVim inspired:

- Just do ``` stow nvim ```, Let Lazy do the magic!


### Old Neovim (custom-init.lua) Setup Requirements:
- [Packer.nvim](https://github.com/wbthomason/packer.nvim): used as a package/plugin manager for nvim
- After installation, Execute `:PackerInstall` in Normal Mode
- Source the config for first time, by executing `:so %` in the init.lua file
- Congrats! You are ready to vim the world

#### Notes for Nvim : 

- If you are on macos, gitsigns pulgin will be a problem for maxfiles limit. To solve this run the following command

      sudo launchctl limit maxfiles 65536 200000

    then to check run : 

      launchctl limit maxfiles

- Install linters and lsp for python

    ```pip install pydocstyle python-lsp-server pyls-flake8```

- Create a undo dir for persistent undo 

    ```mkdir ~/.config/nvim/undodir```

### For Karabiner:

- Copy the contents of karabiner/.config/karabiner to the ~/.config/karabiner/ folder
