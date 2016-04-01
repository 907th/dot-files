export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

# Plugins
plugins=(git rvm rails bundler zsh-syntax-highlighting docker)
export BUNDLED_COMMANDS=(foreman mina)

source $ZSH/oh-my-zsh.sh

eval "$(direnv hook zsh)"

# Aliases
alias gcd='cd "$(git rev-parse --show-toplevel)"'
alias n='nvim'

# Env vars
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export EDITOR="nvim"
export PAGER="less"

# Java
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

# Z
source `brew --prefix`/etc/profile.d/z.sh

# RVM
export PATH="$PATH:$HOME/.rvm/bin"
source "$HOME/.rvm/scripts/rvm"

# Go-lang
export GOROOT="/usr/local/go"
export GOPATH="$HOME/.gocode"
export PATH="$PATH:$GOROOT/bin"

# Docker
eval "$(docker-machine env dev)"
