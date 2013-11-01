# Dot Files Installation Manual (Ubuntu)

## Common Packages
```
sudo apt-get install build-essential ack-grep exuberant-ctags tmux mercurial subversion curl mc xclip sysstat iftop iptraf htop
```

## Ruby + RoR Packages
```
sudo apt-get install libxslt1-dev libxml2-dev libmagic-dev libmagickwand-dev \
libpq-dev
```

## Apache2 + MySQL + PHP5 + phpMyAdmin
```
sudo apt-get install apache2
sudo apt-get install mysql-server libapache2-mod-auth-mysql
sudo apt-get install php5 libapache2-mod-php5 php5-mcrypt php5-mysql
TODO
```

## PostgreSQL + phpPgAdmin

*TODO:*
Вынести функцию для создания бекапа конфигов

```
sudo apt-get install postgresql postgresql-contrib
sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD '1';"
sudo apt-get install phppgadmin
PHPPGADMIN_CONFIG=/etc/phppgadmin/config.inc.php
PHPPGADMIN_CONFIG_BACKUP=$PHPPGADMIN_CONFIG".backup"
sudo cp $PHPPGADMIN_CONFIG $PHPPGADMIN_CONFIG_BACKUP
sudo sed "s|\(\$conf\['extra_login_security'\] = \)true|\1false|" $PHPPGADMIN_CONFIG_BACKUP >$PHPPGADMIN_CONFIG
```

## MongoDB + RockMongo
```
sudo apt-get install mongodb php5-mongo
sudo php5enmod mongo
wget -O rockmongo.zip http://rockmongo.com/downloads/go?id=12
sudo unzip rockmongo.zip -d /var/www/
sudo rm -r /var/www/__MACOSX
sudo chown -R www-data:www-data /var/www/rockmongo
ROCKMONGO_CONFIG=/var/www/rockmongo/config.php
ROCKMONGO_CONFIG_BACKUP=$ROCKMONGO_CONFIG".backup"
sudo cp $ROCKMONGO_CONFIG $ROCKMONGO_CONFIG_BACKUP
sudo sed 's|\(\$MONGO\[\"servers\"\]\[\$i\]\[\"control_auth\"\] = \)true|\1false|' $ROCKMONGO_CONFIG_BACKUP >$ROCKMONGO_CONFIG
```

## SSH
Copy `id_rsa` and `id_rsa.pub` to `~/.ssh`.
```
chmod 0700 ~/.ssh
chmod 0600 ~/.ssh/*
```

## GVim
```
sudo apt-get build-dep vim-gnome
hg clone https://vim.googlecode.com/hg/ vim
cd vim
./configure --with-features=huge --enable-gui=gnome2
make
sudo make install
```

## Skype + Pidgin
```
sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
sudo apt-get update
sudo apt-get install skype
sudo apt-get install pidgin
```

## Git
```
sudo apt-get install libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev asciidoc gitg
wget https://github.com/git/git/archive/master.zip
unzip master.zip
cd git-master
make prefix=/usr/local all
sudo make prefix=/usr/local install
cd contrib/subtree
make
sudo make install
sudo make install-doc
```

## Git Shell
```
git clone git://github.com/rtomayko/git-sh.git
cd git-sh
make
sudo make install
```

## Dot Files
ln -s /home/laise/Work/personal/dot-files/.gitconfig ~/.gitconfig
ln -s /home/laise/Work/personal/dot-files/.vimrc ~/.vimrc
ln -s /home/laise/Work/personal/dot-files/.tmux.conf ~/.tmux.conf
ln -s /home/laise/Work/personal/dot-files/.gemrc ~/.gemrc
ln -s /home/laise/Work/personal/dot-files/.ackrc ~/.ackrc
ln -s /home/laise/Work/personal/dot-files/.vim/colors ~/.vim/colors
ln -s /home/laise/Work/personal/dot-files/.vim/snippets ~/.vim/snippets
ln -s /home/laise/Work/personal/dot-files/.vim/ftplugin ~/.vim/ftplugin
sudo ln -s /home/laise/Work/personal/dot-files/rtmux /usr/local/bin/rtmux
printf "\n# Source .bashrc from dot-files\n. /home/laise/Work/personal/dot-files/.bashrc" >> ~/.bashrc

## RVM
```
\curl -L https://get.rvm.io | bash -s stable
rvm requirements
```

## Terminal Profile
TODO

## GVim Setup
```
mkdir -p ~/.vim/bundle
cd ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git
```
Launch GVim and execute `:BundleInstall`.

Html2haml setup:
```
rvm gemset create html2haml
rvm use 1.9.3@html2haml
gem install html2haml
rvm wrapper 1.9.3@html2haml vim html2haml
```

## Heroku
```
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
heroku login
```

## Dropbox
```
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86" | tar xzf -
~/.dropbox-dist/dropboxd &
```

## Java 7
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java7-installer
