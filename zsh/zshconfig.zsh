neofetch

# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH
fpath+=~/.zfunc
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
#if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Path to your oh-my-zsh installation.
export ZSH=/Users/jd/.oh-my-zsh
export RUST_SRC_PATH=$HOME/rust/src

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#
POWERLEVEL9K_MODE='fontawesome'

export ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator vi_mode history time)

# Set lag time between changing vi modes to .1 seconds instead of default .4
export KEYTIMEOUT=1
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(vi-mode web-search git colored-man colorize github pip python brew osx zsh-syntax-highlighting wd)

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

# For fixing SSH errors
alias fixme="ssh-add -K ~/.ssh/id_rsa && ssh-add -K ~/.ssh/mm"

# Aliases
alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.vimrc"
alias tmuxconfig="vim ~/.tmux.conf"
alias sourcezsh="source ~/.zshrc"
alias sourcetmux="tmux source ~/.tmux.conf"
alias c="clear"
alias alert="tput bel"
alias tkill="tmux kill-session -t"

# Git
alias master="git checkout master"
alias ga="git add"
alias gc="git commit -m"
alias gs="git status"
alias gsh="git stash"
alias gsp="git stash pop"
alias gpull="git pull"
alias gcheck="git checkout"
alias grecent="git for-each-ref --count=10 --sort=-committerdate refs/heads/ --format='%(refname:short)'"

#Rake & Migrations & Other Work Things
alias home="cd ~/"
alias work="emacs code/modernmsg/modernmsg"
alias DEPLOYIAMSURE="bundle exec cap production deploy"
alias restore="bundle exec rake db:restore && tput bel"
alias recreate="bundle exec rake db:recreate! && tput bel"
alias prodconsole="bundle exec cap production run:rails"
alias weather="curl -4 wttr.in"

# Develop
alias code="emacs ."
alias t="tmux"
source $HOME/.zshenv
alias ctags="`brew --prefix`/bin/ctags"

# Checks if there's a frame open

alias vim="/usr/local/bin/vim"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

