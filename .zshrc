export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

# Increase max open files limit (default is 256)
ulimit -S -n 2048

# Fix ^M instead if ^J when hitting <Enter> (typically in `git add -p`)
# See http://askubuntu.com/questions/441744/pressing-enter-produces-m-instead-of-a-newline
stty icrnl

plugins=(zsh-syntax-highlighting git rvm rails bundler docker ansible kubectl)
source $ZSH/oh-my-zsh.sh
eval "$(direnv hook zsh)"
autoload -U add-zsh-hook

# Aliases
alias gcd='cd "$(git rev-parse --show-toplevel)"' # fast cd to git repo root dir
alias mc='mc -u' # -u disables subshell support and dramatically increases UI speed
alias v='nvim'

# Env vars
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR="nvim"
export PAGER="less"

# Java
export JAVA_HOME=$(/usr/libexec/java_home)

# Z
source `brew --prefix`/etc/profile.d/z.sh

# NVM
export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Go-lang
export GOPATH="$HOME/.gocode"

# Rust/Cargo
export PATH="$HOME/.cargo/bin:$PATH"

# Ansible
export ANSIBLE_NOCOWS=1

# TeX
export PATH="$PATH:/Library/TeX/texbin"

# Flutter
export PATH="$PATH:$HOME/Work/Flutter/flutter/bin"

# Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# RVM
export PATH="$HOME/.rvm/bin:$PATH"
source "$HOME/.rvm/scripts/rvm"
