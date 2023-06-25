echo "Initialising ZSH"

# Increase max open files limit (default is 256)
ulimit -S -n 2048

# A command for sourcing other scripts
source-script() {
  if [[ -f "$1" ]]; then
    source "$1"
    echo "Script loaded: $1"
    return 0
  else
    echo "Script does not exist: $1"
    return 1
  fi
}

# Env
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR="vim"
export PAGER="less"
export JAVA_HOME=$(/usr/libexec/java_home)
export NVM_DIR="$HOME/.nvm"
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="robbyrussell"

# Aliases
alias mc='mc -u' # -u disables subshell support and dramatically increases UI speed

# Oh My Zsh
plugins=(zsh-z git rvm rails bundler docker zsh-syntax-highlighting kubectl)
source-script "$ZSH/oh-my-zsh.sh"

# FZF
source-script "$HOME/.fzf.zsh"

# NVM
source-script "$NVM_DIR/nvm.sh"

# RVM
source-script "$HOME/.rvm/scripts/rvm"

# Rust
export PATH="$PATH:$HOME/.cargo/bin"

# Go lang
export PATH="$PATH:/usr/local/go/bin"
