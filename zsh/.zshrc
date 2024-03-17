# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/smartyape/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"
# Uncomment the following line to enable command auto-correction.  # ENABLE_CORRECTION="true" # Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work) # See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias vim='vimx'
# export EDITOR='vimx'
# export EDITOR='vim'
# alias tmux='tmux -u'
alias vocab='/Users/smartyape/Playground/Build-My-Vocab/vocab.py'
alias startup='/Users/smartyape/Playground/shell_scripts/launch.sh && exit'
alias work-tmux='/Users/smartyape/Playground/shell_scripts/tmux_scripts/work-tmux.sh'
alias fun-tmux='/Users/smartyape/Playground/shell_scripts/tmux_scripts/fun-tmux.sh'
alias round-tmux='/Users/smartyape/Playground/shell_scripts/tmux_scripts/round-tmux.sh'
alias grace-tmux='/Users/smartyape/Playground/shell_scripts/tmux_scripts/grace-tmux.sh'
alias acd-tmux='/Users/smartyape/Playground/shell_scripts/tmux_scripts/acd-tmux.sh'
alias scaletorch-tmux='/Users/smartyape/Playground/shell_scripts/tmux_scripts/scaletorch-tmux.sh'
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

# For using tab to autocomplete
bindkey '^[[Z' autosuggest-accept  # shift + tab  | autosuggest

# For tmux UTF-8 Characters to show up properly
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/smartyape/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/smartyape/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/smartyape/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/smartyape/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
#

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# poetry
export PATH="/Users/smartyape/.local/bin:$PATH"


# Requires https://github.com/caarlos0/timer to be installed
# brew install caarlos0/tap/timer
# brew install terminal-notifier

# Mac setup for pomo
alias work="timer 60m && terminal-notifier -message 'Pomodoro'\
        -title 'Work Timer is up! Take a Break 😌'\
        -sound Crystal"
        
alias rest="timer 10m && terminal-notifier -message 'Pomodoro'\
        -title 'Break is over! Get back to work 🤓'\
        -sound Heroine"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export VISUAL=nvim
export EDITOR="$VISUAL"
export PATH="/opt/homebrew/opt/go@1.19.1/bin:$PATH"
alias nv='nvim'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/smartyape/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/smartyape/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/smartyape/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/smartyape/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
