export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git rvm rails)

alias cdg='cd "$(git rev-parse --show-toplevel)"'

source $ZSH/oh-my-zsh.sh

eval "$(direnv hook zsh)"

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
export LANG=ru_RU.UTF-8

export EDITOR="nvim"
export PAGER="less"

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

# Z
. `brew --prefix`/etc/profile.d/z.sh

# RVM
export PATH="$PATH:$HOME/.rvm/bin"
source "$HOME/.rvm/scripts/rvm"

# OCaml package manager (opam)
. $HOME/.opam/opam-init/init.zsh #> /dev/null 2> /dev/null || true

# Go-lang
export GOROOT="/usr/local/go"
export GOPATH="$HOME/.gocode"
export PATH="$PATH:$GOROOT/bin"

# Adnroid SDK
export PATH="$PATH:$HOME/Work/android-sdk/tools"
export PATH="$PATH:$HOME/Work/android-sdk/platform-tools"
