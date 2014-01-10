#!/usr/bin/env perl

use Time::HiRes ('time');

@opts = (
  'Prepare_SSH_Dir',
  'Configure_Apt_And_Upgrade',
  'Install_Common_Packages',
  'Install_Apache_MySQL_PHP_PhpMyAdmin',
  'Install_PostgreSQL_PhpPgAdmin',
  'Install_MongoDB_RockMongo',
  'Install_Google_Chrome',
  'Install_GVim',
  'Install_Skype',
  'Install_Git',
  'Install_Git_Shell',
  'Install_RVM',
  'Install_Dropbox',
  'Install_Java',
  'Install_ElasticSearch',
  'Setup_Dot_Files',
  'Install_Vundle',
  'Install_Html2Haml_Wrapper_For_Vim',
  'Install_NodeJS',
  'Install_Zeal_Documentation_Server',
  'Install_VirtualBox',
  'Install_LaTeX',
  'Install_Vagrant'
);

%other_opts = (
  'a' => 'Run_All',
  'x' => 'Exit'
);

sub MainMenu {
  print "Choose option to run:\n";
  foreach (0..$#opts) {
    printf "%d) %s\n", $_, Name($opts[$_]);
  }
  foreach (keys %other_opts) {
    printf "%s) %s\n", $_, Name($other_opts{$_});
  }
  print 'Your choice: ';
  my $chosen = <STDIN>;
  chop $chosen;
  if ($chosen =~ m/^\d+$/) {
    Run($opts[$chosen]);
  } else {
    Run($other_opts{$chosen});
  }
  print "---\n";
}

sub Run {
  my $f = $_[0];
  if (! defined $f) {
    print "Can't run it, try again!\n";
    return;
  }
  my $t = time;
  printf "Running %s...\n", Name($f);
  &$f();
  printf "%s finished in %.4f sec.\n", Name($f), time - $t;
}

sub Run_All {
  foreach (@opts) {
    Run($_);
  }
}

sub Exit {
  print "Bye, bye!\n";
  exit 0;
}

sub Exe {
  system <<"  CMD";
    set -xv

    # Always cd to setup dir
    WD=~/Setup
    mkdir -p \$WD
    cd \$WD

    ${_[0]}
  CMD
}

sub Name {
  return $_[0] =~ s/_/ /rg;
}

while (1) {
  MainMenu;
}


#
#  Options
#

sub Prepare_SSH_Dir {
  Exe(<<'  CMD');
    mkdir -p ~/.ssh
    chmod 0700 ~/.ssh
    cd ~/.ssh
    touch id_rsa id_rsa.pub
    chmod 0600 id_rsa id_rsa.pub
    echo 'You need to install SSH keys manually!'
  CMD
}

sub Configure_Apt_And_Upgrade {
  Exe(<<'  CMD');
    sudo apt-get -y update
    sudo apt-get -y upgrade
    sudo apt-get -y autoremove
  CMD
}

sub Install_Common_Packages {
  Exe(<<'  CMD');
    sudo apt-get -y install \
      build-essential ack-grep exuberant-ctags tmux \
      mercurial subversion curl mc xclip xsel sysstat iftop iptraf htop \
      libxslt1-dev libxml2-dev libmagic-dev libmagickwand-dev \
      libpq-dev libqt4-dev libmysqlclient-dev libcurl4-gnutls-dev \
      libexpat1-dev gettext libz-dev libssl-dev asciidoc \
      python-pip
  CMD
}

sub Install_Apache_MySQL_PHP_PhpMyAdmin {
  Exe(<<'  CMD');
    sudo apt-get -y install mysql-server
    sudo apt-get -y install php5 php5-mysql
    sudo apt-get -y install apache2 libapache2-mod-php5
    sudo apt-get -y install phpmyadmin
  CMD
}

sub Install_PostgreSQL_PhpPgAdmin {
  Exe(<<'  CMD');
    sudo apt-get -y install postgresql postgresql-contrib
    sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD '1';"
    sudo apt-get -y install phppgadmin

    # Switch off PhpPgAdmin extra security option
    CFG=/etc/phppgadmin/config.inc.php
    BAK=$CFG'.backup'
    sudo cp -n $CFG $BAK
    sudo chmod 0666 $CFG
    sudo sed "s|\(\$conf\['extra_login_security'\] = \)true|\1false|" $BAK >$CFG
    sudo chmod 0644 $CFG
  CMD
}

sub Install_MongoDB_RockMongo {
  Exe(<<'  CMD');
    sudo apt-get -y install mongodb php5-mongo
    sudo php5enmod mongo
    sudo service apache2 restart

    # Install RockMongo
    PKG=rockmongo.zip
    wget -O $PKG http://rockmongo.com/downloads/go?id=12
    sudo unzip $PKG -d /var/www/
    sudo rm -r /var/www/__MACOSX

    # Switch off RockMongo auth control
    CFG=/var/www/rockmongo/config.php
    BAK=$CFG'.backup'
    sudo cp -n $CFG $BAK
    sudo chmod 0666 $CFG
    sudo sed 's|\(\$MONGO\[\"servers\"\]\[\$i\]\[\"control_auth\"\] = \)true|\1false|' $BAK >$CFG
    sudo chmod 0644 $CFG
  CMD
}

sub Install_Google_Chrome {
  Exe(<<'  CMD');
    PKG=google-chrome-stable_current_amd64.deb
    wget -O $PKG https://dl.google.com/linux/direct/$PKG
    sudo dpkg -i $PKG
  CMD
}

sub Install_GVim {
  Exe(<<'  CMD');
    sudo apt-get -y build-dep vim-gnome
    hg clone https://vim.googlecode.com/hg/ vim
    cd vim
    ./configure --with-features=huge --enable-gui=gnome2 --enable-luainterp=yes
    make
    sudo make install
  CMD
}

sub Install_Skype {
  Exe(<<'  CMD');
    sudo add-apt-repository -y "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
    sudo apt-get -y update
    sudo apt-get -y install skype
  CMD
}

sub Install_Git {
  Exe(<<'  CMD');
    # Remove existing git and gitg
    sudo apt-get -y remove git gitg

    # Install git
    PKG=git.zip
    wget -O $PKG https://github.com/git/git/archive/master.zip
    unzip $PKG
    cd git-master
    make prefix=/usr/local all
    sudo make prefix=/usr/local install

    # Install git-subtree plugin
    cd contrib/subtree
    make
    sudo make install
    sudo make install-doc

    # Install gitg
    sudo apt-get -y install gitg
  CMD
}

sub Install_Git_Shell {
  Exe(<<'  CMD');
    git clone git://github.com/rtomayko/git-sh.git
    cd git-sh
    make
    sudo make install
  CMD
}

sub Install_RVM {
  Exe(<<'  CMD');
    \curl -L https://get.rvm.io | bash -s stable
    RVM='source ~/.rvm/scripts/rvm && rvm'
    bash -c "$RVM requirements
    bash -c "$RVM install 1.9.3"
    #bash -c "$RVM install 2.0.1"
  CMD
}

sub Install_Dropbox {
  Exe(<<'  CMD');
    PKG=dropbox_1.6.0_amd64.deb
    wget -O $PKG https://www.dropbox.com/download?dl=packages/ubuntu/$PKG
    sudo dpkg -i $PKG
  CMD
}

sub Install_Java {
  Exe(<<'  CMD');
    sudo add-apt-repository -y ppa:webupd8team/java
    sudo apt-get -y update
    sudo apt-get -y install oracle-java7-installer
  CMD
}

sub Install_ElasticSearch {
  Exe(<<'  CMD');
    PKG=elasticsearch-0.90.7.deb
    wget -O $PKG https://download.elasticsearch.org/elasticsearch/elasticsearch/$PKG
    sudo dpkg -i $PKG
    sudo service elasticsearch start
  CMD
}

sub Setup_Dot_Files {
  Exe(<<'  CMD');
    WD=~/Work/Personal
    mkdir -p $WD
    cd $WD

    # Clone dot-files repo
    git clone https://github.com/907th/dot-files.git

    # Rewrite repo remote path to use ssh
    CFG=$WD/dot-files/.git/config
    BAK=$CFG'.backup'
    cp -n $CFG $BAK
    sed 's|https://github.com/\(907th/dot-files\.git\)|git@github\.com:\1|' $BAK >$CFG
    rm $BAK

    # Create symlinks
    DF=$HOME/Work/Personal/dot-files

    ln -sfT $DF/.gitconfig ~/.gitconfig
    ln -sfT $DF/.tmux.conf ~/.tmux.conf
    ln -sfT $DF/.gemrc ~/.gemrc
    ln -sfT $DF/.ackrc ~/.ackrc
    ln -sfT $DF/.vimrc ~/.vimrc

    mkdir -p ~/.vim
    ln -sfT $DF/.vim/colors ~/.vim/colors
    ln -sfT $DF/.vim/snippets ~/.vim/snippets
    ln -sfT $DF/.vim/ftplugin ~/.vim/ftplugin

    sudo ln -sfT $DF/tmux-rails /usr/local/bin/tmux-rails

    # Configure .bashrc and .bash_profile
    printf "\n\n# Source .bashrc from dot-files\n. $DF/.bashrc\n" >> ~/.bashrc
    echo '. ~/.bashrc' > ~/.bash_profile
  CMD
}

sub Install_Vundle {
  Exe(<<'  CMD');
    # Cd to vim's bundle dir
    WD=~/.vim/bundle
    mkdir -p $WD
    cd $WD

    # Install vundle from repo
    git clone https://github.com/gmarik/vundle.git

    echo 'Do not forget to run :BundleInstall in Vim!'
  CMD
}

sub Install_Html2Haml_Wrapper_For_Vim {
  Exe(<<'  CMD');
    RVM='source ~/.rvm/scripts/rvm && rvm'
    bash -c "$RVM use 1.9.3 && rvm gemset create html2haml"
    bash -c "$RVM use 1.9.3@html2haml && gem install html2haml"
    bash -c "$RVM wrapper 1.9.3@html2haml vim html2haml"
  CMD
}

sub Install_NodeJS {
  Exe(<<'  CMD');
    sudo add-apt-repository -y ppa:chris-lea/node.js
    sudo apt-get update
    sudo apt-get install -y python-software-properties python g++ make
    sudo apt-get install -y nodejs
  CMD
}

sub Install_Zeal_Documentation_Server {
  Exe(<<'  CMD');
    sudo add-apt-repository -y ppa:canonical-qt5-edgers/qt5-proper
    sudo add-apt-repository -y ppa:jerzy-kozera/zeal-ppa
    sudo apt-get -y update
    sudo apt-get -y install zeal
  CMD
}

sub Install_VirtualBox {
  Exe(<<'  CMD');
    wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
    sudo apt-get -y update
    sudo apt-get -y install dkms virtualbox
  CMD
}

sub Install_LaTeX {
  Exe(<<'  CMD');
    sudo apt-get -y install texlive-full
  CMD
}

sub Install_Vagrant {
  Exe(<<'  CMD');
    PKG=vagrant_1.4.2_x86_64.deb
    wget -O $PKG https://dl.bintray.com/mitchellh/vagrant/$PKG
    sudo dpkg -i $PKG
  CMD
}

sub TODO {
  Exe(<<'  CMD');
    # TODO
  CMD
}

__END__
