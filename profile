# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

export ZSH_THEME="pure"

plugins=(git textmate osx ruby python)

#export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/usr/texbin"

source $ZSH/oh-my-zsh.sh

# fix for garbled text in vim?
export TERM=xterm-256color

# use incremental search
bindkey "^R" history-incremental-search-backward 

# tmux
alias tmux='tmux -2' # use 256 colors

# vim
alias vi='vim'

# latex path
export PATH="$PATH:/usr/local/texlive/2016/bin/x86_64-darwin"

# added by Anaconda3 4.3.0 installer
export PATH="/Users/jacobreinhold/anaconda3/bin:$PATH"
