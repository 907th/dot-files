#!/bin/bash

set -e

echo "Installing Homebrew"
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo "Installing ZSH"
brew install zsh

echo "Changing default shell to ZSH"
sudo sh -c "echo \"$(which zsh)\" >> /etc/shells"
sudo chsh -s "$(which zsh)" "$USER"

echo "Installing Oh My ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Installing FZF"
brew install fzf
$(brew --prefix)/opt/fzf/install

echo "Downloading Z"
zsh -i -c 'git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z'

echo "Downloading ZSH Syntax Highliting"
zsh -i -c 'git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting'

echo "Downloading Pure prompt"
git clone https://github.com/sindresorhus/pure.git $HOME/.zsh-pure

echo "Installing Vim"
brew install vim

echo "Installing RVM"
curl -sSL https://get.rvm.io | bash -s stable --autolibs=read-fail

echo "Installing NVM"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

echo "Creating MacVim link"
sudo ln -s /Applications/MacVim.app/Contents/bin/mvim /usr/local/bin/mvim

echo "Downloading Dracula theme for Midnight Commander"
MC_THEMES_DIR=$HOME/.local/share/mc/skins
MC_DRACULA_THEME_URL=https://raw.githubusercontent.com/dracula/midnight-commander/master/skins
mkdir -p $MC_THEMES_DIR
curl -s $MC_DRACULA_THEME_URL/dracula.ini -o $MC_THEMES_DIR/dracula.ini
curl -s $MC_DRACULA_THEME_URL/dracula256.ini -o $MC_THEMES_DIR/dracula256.ini

echo "Linking another dot-files"
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
create-link() {
  local source="$SCRIPT_DIR/$1"
  local target="$HOME/$1"
  echo "Linking $target to $source"
  rm -rf "$target"
  ln -s "$source" "$target"
}
create-link .vim
create-link .bash_profile
create-link .bashrc
create-link .gemrc
create-link .gitconfig
create-link .gitignore_global
create-link .npmrc
create-link .profile
create-link .pryrc
create-link .psqlrc
create-link .tmux.conf
create-link .zshrc

echo "Done"
