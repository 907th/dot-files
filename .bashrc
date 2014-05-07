# Fix terminal keys
stty -ixon -ixoff

# Commands aliases
alias ack='ack-grep'
alias tmux='tmux -2'
alias t='tmux -2'
alias g='gvim'
alias v='vim'
alias s='git-sh'
alias h='heroku'

# Listing Aliases
alias l='\ls --color'
alias ls='\ls --color'
alias ll='\ls -l --color'
alias la='\ls -l -a --color'

# RVM
alias gemset='rvm gemset'
if [[ ! "$PATH" =~ (^|:)"$HOME/.rvm/bin"(:|$) ]]; then
  export PATH="$PATH:$HOME/.rvm/bin"
fi
if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
  . "$HOME/.rvm/scripts/rvm"
fi

# Heroku Toolbelt
export PATH="$PATH:/usr/local/heroku/bin"

# Go vars
export GOROOT="$HOME/.go"
export GOPATH="$HOME/.gos"
export GOARCH='amd64'
export GOOS='linux'
export PATH="$PATH:$GOROOT/bin"

# Editor & Pager
export PAGER='less'
export EDITOR='vim'

# Color prompt
export PS1="\[$(tput bold)\]\[$(tput setaf 7)\]\u\[$(tput setaf 3)\]@\[$(tput setaf 7)\]\H \[$(tput setaf 2)\]\w \[$(tput setaf 4)\]$ \[$(tput sgr0)\]"
