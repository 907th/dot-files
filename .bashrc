# Fix terminal keys
stty -ixon -ixoff

# Tmux
alias tmux='tmux -2'

# Ack
alias ack='ack-grep'

# Listing Aliases
alias l='\ls --color'
alias ls='\ls --color'
alias ll='\ls -l --color'
alias la='\ls -l -a --color'

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# ENV
export PAGER=less
export EDITOR=vim
