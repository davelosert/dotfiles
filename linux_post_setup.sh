#!/bin/bash

# Daves Linux Install Script
## ###################################################
## --------------------- PREPARE --------------------- ## 
###################################################

## GIT
sudo add-apt-repository ppa:git-core/ppa

## Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

## Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 'BBEBDCB318AD50EC6865090613B00F1FD2C19886'
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

## I3-WM
sudo echo "deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe"| sudo tee -a /etc/apt/sources.list sudo apt-get update sudo apt-get --allow-unauthenticated install sur5r-keyring

## ###################################################
## --------------------- INSTALL --------------------- ##
###################################################
sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes upgrade

## Install all apt-packages
sudo apt-get install -y zsh git vim google-chrome-stable language-pack-de i3 python-pip

## Upgrade PIP
pip install --upgrade pip

## Install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
pip install powerline-status

### Install powerline fonts
cd ~/Downloads
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

sudo mv PowerlineSymbols.otf /usr/share/fonts/X11/misc fc-cache -vf /usr/share/fonts/X11/misc
mkdir -p ~/.config/fontconfig/conf.d/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

mkdir -p ~/.local/share/fonts
wget https://github.com/powerline/fonts/archive/master.zip
unzip master.zip 
./fonts-master/install.sh

gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_system_font --type=boolean false
gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_custom_font --type=boolean true
gconftool-2 --set /apps/gnome-terminal/profiles/Default/font --type string "Meslo LG S for Powerline RegularForPowerline 11"

## Load solarized theme
cd ~/Downloads
git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git
cd mate-terminal-colors-solarized
./install.sh

## Install NVM and Node - will append to .zshrc
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.4/install.sh | bash 
export NVM_DIR="$HOME/.nvm" 
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

echo -e 'export NVM_DIR="$HOME/.nvm"\n[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm' >> ~/.zshrc
source ~/.zshrc
nvm install node

## Install Java
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u92-b14/jdk-8u92-linux-x64.tar.gz
tar -xzf jdk-8u92-linux-x64.tar.gz
sudo mkdir -p /opt/Oracle_Java/
sudo mv jdk1.8.0_92 /opt/Oracle_Java
sudo chown -R root:root /opt/Oracle_Java/jdk1.8.0_92

sudo update-alternatives --install "/usr/bin/java" "java" "/opt/Oracle_Java/jdk1.8.0_92/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "/opt/Oracle_Java/jdk1.8.0_92/bin/javac" 1
sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/opt/Oracle_Java/jdk1.8.0_92/bin/javaws" 1 
sudo update-alternatives --install "/usr/bin/jar" "jar" "/opt/Oracle_Java/jdk1.8.0_92/bin/jar" 1

echo '*************************'
echo 'SUCCESS!'
echo '*************************'
echo 'All that`s left to do is create a new Terminal-Profile and set Meslo-Powerline as Font!'

