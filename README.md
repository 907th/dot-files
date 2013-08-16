# ...
sudo apt-get install build-essential ack-grep exuberant-ctags

# GVim
sudo apt-get build-dep vim-gnome
sudo apt-get install mercurial
hg clone https://vim.googlecode.com/hg/ vim
cd vim
./configure --with-features=huge --enable-gui=gnome2
make
sudo make install

# Skype
sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
sudo apt-get update
sudo apt-get install skype

# Git
sudo apt-get install libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev asciidoc
wget https://github.com/git/git/archive/master.zip
unzip master.zip
cd git-master
make prefix=/usr/local all
sudo make prefix=/usr/local install
cd contrib/subtree
make
sudo make install
sudo make install-doc

# RVM
sudo apt-get install curl
\curl -L https://get.rvm.io | bash -s stable






