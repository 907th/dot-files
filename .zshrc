export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

# Fix ^M instead if ^J when hitting <Enter> (typically in `git add -p`)
# See http://askubuntu.com/questions/441744/pressing-enter-produces-m-instead-of-a-newline
stty icrnl

# Plugins
plugins=(git rvm rails bundler zsh-syntax-highlighting docker)
export BUNDLED_COMMANDS=(foreman mina)

source $ZSH/oh-my-zsh.sh

eval "$(direnv hook zsh)"

# Aliases
alias gcd='cd "$(git rev-parse --show-toplevel)"'
alias n='nvim'
alias rub='rubocop'
alias rug='rubocop-git'

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

# NVM
export NVM_DIR="/Users/laise/.nvm"
source "$NVM_DIR/nvm.sh"

# Go-lang
export GOPATH="$HOME/.gocode"
export PATH="$PATH:$GOROOT/bin"

# Docker
eval "$(docker-machine env dev)"
