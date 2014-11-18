export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git rvm rails)

source $ZSH/oh-my-zsh.sh

eval "$(direnv hook zsh)"

export PATH="/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin"
export LANG=ru_RU.UTF-8

export EDITOR="vim"
export PAGER="less"

export PATH="$PATH:$HOME/.rvm/bin"
source "$HOME/.rvm/scripts/rvm"

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
