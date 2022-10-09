## GNU Stow to manage dotfiles ###

### Usage :

```stow <dir_name> ```
this will create a symlink at approriate place for the respective dotfile


### Neovim Setup Requirements:
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
