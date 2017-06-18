ves Linux Install Script
##########################################################
## --------------------- PREPARE --------------------- ## 
##########################################################

## GIT
sudo add-apt-repository ppa:git-core/ppa

## Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

## Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 'BBEBDCB318AD50EC6865090613B00F1FD2C19886'
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list


###########################################################
## INSTALL BASIC PROGRAMS & PACKAGES ##
###########################################################
sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes upgrade

## Install all needed programms from apt
sudo apt-get install -y zsh git vim google-chrome-stable language-pack-de i3 python-pip scrot compton spotify-client

## Upgrade PIP
pip install --upgrade pip

###########################################################
## PIMP TERMINAL
###########################################################

## Install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
sudo pip install powerline-status

### Install powerline fonts
cd ~/Downloads
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

sudo mv PowerlineSymbols.otf /usr/share/fonts/X11/misc 
fc-cache -vf /usr/share/fonts/X11/misc
mkdir -p ~/.config/fontconfig/conf.d/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

mkdir -p ~/.local/share/fonts
wget https://github.com/powerline/fonts/archive/master.zip
unzip master.zip 
./fonts-master/install.sh

gsettings set org.gnome.desktop.interface font-name "Meslo LG S for Powerline RegularForPowerline 11"

## Load solarized theme
git clone https://github.com/chriskempson/base16-gnome-terminal.git ~/.config/base16-gnome-terminal
source ~/.config/base16-gnome-terminal/base16-solarized.dark.sh

## Install ZSH Plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/dave/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git /home/dave/.oh-my-zsh/custom/plugins/zsh-autosuggestions


###########################################################
## REPLACE WINDOW MANAGER
###########################################################
## Install i3-gaps deps
sudo apt-get install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev

## Install i3-gaps
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps

autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/

../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install

## Install additional I3 Plugins & required packages 
sudo apt-get install i3blocks fonts-font-awesome rofi feh gsimplecal



###########################################################
##  Install developer tools
###########################################################
## Install gnome keyring support for git
sudo apt-get install libgnome-keyring-dev
sudo make --directory=/usr/share/doc/git/contrib/credential/gnome-keyring
git config --global credential.helper /usr/share/doc/git/contrib/credential/gnome-keyring/git-credential-gnome-keyring



## Install VIM plugins
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized
git clone https://github.com/vim-airline/vim-airline.git ~/.vim/bundle/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes

## Install NVM and Node - will append to .zshrc
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash

export NVM_DIR="$HOME/.nvm" 
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

echo -e 'export NVM_DIR="$HOME/.nvm"\n[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm' >> ~/.zshrc
source ~/.zshrc
nvm install node

echo '*************************'
echo '*********SUCCESS!********'
echo '*************************'
echo 'To finalize installation, go to your terminal settings and follow these steps:'
echo '1) Set "Base 16 Solarized Default" as the default profile'
echo '2) In the profile settings: Set transparency to about 25% (depending on your screen)'
echo '3) In the profile settings: Disable the scroolbar'

echo 'You will also have to set the right WIFI Interface in .i3/scripts/wifi for the Statusbar to work'
