echo "Initialising ZSH"

# Increase max open files limit (default is 256)
ulimit -S -n 2048

# Fix ^M instead if ^J when hitting <Enter> (typically in `git add -p`)
# See http://askubuntu.com/questions/441744/pressing-enter-produces-m-instead-of-a-newline
stty icrnl

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
alias gcd='cd "$(git rev-parse --show-toplevel)"' # go to a git repository root directory
alias mc='mc -u' # -u disables subshell support and dramatically increases UI speed
alias v='vim'

# Oh My Zsh
plugins=(zsh-syntax-highlighting zsh-z git rvm rails bundler docker)
source-script "$ZSH/oh-my-zsh.sh"

# FZF
source-script "$HOME/.fzf.zsh"

# NVM
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
if source-script "$NVM_DIR/nvm.sh"; then
  add-zsh-hook chpwd load-nvmrc
  load-nvmrc
fi

# RVM
if source-script "$HOME/.rvm/scripts/rvm"; then
  export PATH="$HOME/.rvm/bin:$PATH"
fi

