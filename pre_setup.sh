#!/usr/bin/env bash


#
# SSH
#

WD=~/.ssh
mkdir -p $WD

# Prepare .ssh dir
chmod 0700 $WD

# id_rsa
touch $WD/id_rsa
chmod 0600 $WD/id_rsa
echo 'Paste your private key (id_rsa, Ctrl-D when done):'
cat > $WD/id_rsa

# id_rsa.pub
touch $WD/id_rsa.pub
chmod 0600 $WD/id_rsa.pub
echo 'Paste your public key (id_rsa.pub, Ctrl-D when done):'
cat > $WD/id_rsa.pub


#
# dot-files
#

WD=/work
DF=/work/dot-files
mkdir -p $WD

sudo apt-get -y install git
git clone git@github.com:907th/dot-files.git $WD/dot-files

# Create symlinks
ln -s -f -t ~ \
  $DF/.gitconfig $DF/.tmux.conf $DF/.gemrc $DF/.ackrc
  $DF/.vimrc $DF/.railsrc $DF/.rspec $DF/.bashrc.d

# Symlink Vim dirs
mkdir -p ~/.vim
ln -s -f -t ~/.vim \
  $DF/.vim/colors $DF/.vim/snippets $DF/.vim/ftplugin

# .bashrc and .bash_profile
printf "\n\n. $DF/.bashrc\n" >> ~/.bashrc
echo '. ~/.bashrc' > ~/.bash_profile
