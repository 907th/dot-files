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
export ZSH_THEME=""

# Aliases
alias mc='mc -u' # -u disables subshell support and dramatically increases UI speed

# FZF
source-script "$HOME/.fzf.zsh"

# NVM
source-script "$NVM_DIR/nvm.sh"

# Golang
export PATH="/usr/local/go/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# RVM
source-script "$HOME/.rvm/scripts/rvm"

# Pure prompt
fpath+=($HOME/.zsh-pure)
autoload -U promptinit; promptinit
prompt pure

# Oh My Zsh
plugins=(zsh-syntax-highlighting zsh-z git docker kubectl rust golang rvm rails bundler)
source-script "$ZSH/oh-my-zsh.sh"

# ~/.zshrc.local
source-script "$HOME/.zshrc.local"
