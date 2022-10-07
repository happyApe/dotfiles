### Use GNU Stow to manage dotfiles ###

Usage :

```stow <dir_name> ```
this will create a symlink at approriate place for the respective dotfile


Notes for Nvim : 

- If you are on macos, gitsigns pulgin will be a problem for maxfiles limit. To solve this run the following command

      sudo launchctl limit maxfiles 65536 200000

    then to check run : 

      launchctl limit maxfiles

- Install linters and lsp for python

    ```pip install pydocstyle python-lsp-server pyls-flake8```

- Create a undo dir for persistent undo 

    ```mkdir ~/.config/nvim/undodir```
