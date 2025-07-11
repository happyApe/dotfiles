# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Starship 
bindkey -v
if [[ "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select" || \
      "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select-wrapped" ]]; then
    zle -N zle-keymap-select "";
fi
eval "$(starship init zsh)"

# Zoxide
eval "$(zoxide init zsh)"

# FZF
eval "$(fzf --zsh)"



# Aliases
alias vocab='/Users/daddyduck/Playground/Build-My-Vocab/vocab.py'
alias startup='/Users/daddyduck/Playground/shell_scripts/launch.sh && exit'
alias work-tmux='/Users/daddyduck/Playground/shell_scripts/tmux_scripts/work-tmux.sh'
alias fun-tmux='/Users/daddyduck/Playground/shell_scripts/tmux_scripts/fun-tmux.sh'
alias round-tmux='/Users/daddyduck/Playground/shell_scripts/tmux_scripts/round-tmux.sh'
alias grace-tmux='/Users/daddyduck/Playground/shell_scripts/tmux_scripts/grace-tmux.sh'
alias acd-tmux='/Users/daddyduck/Playground/shell_scripts/tmux_scripts/acd-tmux.sh'
alias scaletorch-tmux='/Users/daddyduck/Playground/shell_scripts/tmux_scripts/scaletorch-tmux.sh'
alias rr='ranger'
alias dkc='docker-compose'
alias dkpa='docker ps -a'
alias lucius='python3 -m src.tools.lucius'

# Git related
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gd='git diff'
alias gl='git log'
alias gr='git restore'
alias gco='git checkout'
alias gp='git pull'
alias gph='git push'
alias gsh='git stash'

# For using tab to autocomplete
bindkey '^[[Z' autosuggest-accept  # shift + tab  | autosuggest

# For tmux UTF-8 Characters to show up properly
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
#

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Requires https://github.com/caarlos0/timer to be installed
# brew install caarlos0/tap/timer
# brew install terminal-notifier
#
export VISUAL=nvim
export EDITOR="$VISUAL"
alias nv='nvim'
alias cd='z'
alias lg='lazygit'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

eval "$(zoxide init zsh)"

# Starship 
bindkey -v
if [[ "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select" || \
      "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select-wrapped" ]]; then
    zle -N zle-keymap-select "";
fi
eval "$(starship init zsh)"
