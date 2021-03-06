#!/bin/bash

# Run apt-get installations
echo "Running 'apt-get update && apt-get upgrade'..."
apt-get update && apt-get upgrade

echo "Installing git..."
apt-get install git

echo "Installing vim..."
apt-get install vim

echo "Installing gdebi..."
apt-get install gdebi

echo "Installing exfat utilities..."
apt-get install exfat-utils exfat-fuse

echo "Installing Gnome classic desktop..."
apt-get install gnome-session-flashback

echo "Installing Alacarte menu manager..."
apt-get install alacarte

echo "Installing 'Hack' font..."
apt-get install fonts-hack-ttf

# Run wget installations
echo "Installing atom.io editor..."
wget -O ~/Downloads/atom-amd64.deb https://atom.io/download/deb
gdebi ~/Downloads/atom-amd64.deb


# Run git installations
echo "Installing Gnome Solarized colorscheme..."
apt-get install dconf-cli
git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git ~/Downloads/gnome-terminal-colors-solarized
~/Downloads/gnome-terminal-colors-solarized/install.sh

echo "Installing VIM Solarized colorscheme..."
git clone https://github.com/altercation/vim-colors-solarized.git ~/Downloads/vim-colors-solarized
mkdir -p ~/.vim/colors
cp ~/Downloads/vim-colors-solarized/colors/solarized.vim ~/.vim/colors


# Copy configurations
echo "Copying VIM configuration..."
if [ ! -e "~/.vimrc" ]
then
    cp config/my_vimrc ~/.vimrc
else
    echo "~/.vimrc exists, backing up old .vimrc..."
    mv ~/.vimrc ~/.vimrc.OLD
    cp config/my_vimrc ~/.vimrc
fi

echo "Adding bash configuration..."
cat config/my_bashrc >> ~/.bashrc
source ~/.bashrc

