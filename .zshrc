echo "Initialising ZSH"

# Increase max open files limit (default is 256)
ulimit -S -n 2048

# Configure shortcuts
bindkey '^[OH' beginning-of-line # <Home> jumps to beginning of line.
bindkey '^[[F' end-of-line # <End> jumps to end of line.
bindkey '^[[1;3C' forward-word   # <Alt-Right> jumps to prev word.
bindkey '^[[1;3D' backward-word  # <Alt-Left> jumps to next word.
bindkey '^U' backward-kill-line  # <C-u> deletes text before cursor (like in Bash).

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

# Global env vars
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR="vim"
export PAGER="less"
export LESS="-S -R" # -S chops long lines instead of wrapping them, -R enables color codes.
export JAVA_HOME=$(/usr/libexec/java_home)

# Aliases
alias mc='mc -u' # -u disables subshell support and dramatically increases UI speed.
alias n='nvim'

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Pure prompt
export ZSH_THEME=""
fpath+=($HOME/.zsh-pure)
autoload -U promptinit; promptinit
prompt pure

# Oh My Zsh
# NOTE: zsh-syntax-highlighting must be the last included plugin!
export ZSH="$HOME/.oh-my-zsh"
plugins=(zsh-z fzf git docker docker-compose kubectl rust golang nvm rbenv rails bundler zsh-syntax-highlighting)
source-script "$ZSH/oh-my-zsh.sh"

# ~/.zshrc.local
source-script "$HOME/.zshrc.local"
