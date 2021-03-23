#!/bin/bash

####### PLEASE CLONE THE REPOSITORY IN YOUR HOME DIRECTORY ONLY

### Set Variables

## USER
USER=$(whoami)

## Home directory
HOME="/home/$USER"

## Dotfiles repository
DOT="$HOME/dotfiles-arch-i3-nord"

## Backup directory
BACKUP="$HOME/old-config.bak"

## Config directory
CONFIG="$HOME/.config"

## Application files and directories

# Directories in .config
ALACRITTY="$CONFIG/alacritty"
BAT="$CONFIG/bat"
CAVA="$CONFIG/cava"
DUNST="$CONFIG/dunst"
FISH="$CONFIG/fish"
I3="$CONFIG/i3"
I3B="$CONFIG/i3blocks"
I3S="$CONFIG/i3status"
KITTY="$CONFIG/kitty"
PB="$CONFIG/polybar"
ROFI="$CONFIG/rofi"
SPTFY="$CONFIG/spicetify"
VIS="$CONFIG/vis"
ZT="$CONFIG/zathura"

# Directories in ~
BLS="$HOME/betterlockscreen-12hr"
SP="$HOME/startpage_3"
PIC="$HOME/Pictures"

# Files in ~
BASHRC="$HOME/.bashrc"
TMUX="$HOME/.tmux.conf"
VIMRC="$HOME/.vimrc"

#### SCRIPT START

/bin/echo -e "\e[1;32mStarting install...\e[0m"

## Install packages
/bin/echo -e "\e[1;32mInstalling required packages from package list...\e[0m"

# Pacman packages
sudo pacman -S --needed $(cat package_list/pacman_packages.txt)

# AUR packages
yay -S $(cat package_list/aur_packages.txt)

/bin/echo -e "\e[1;32mPackages Installed!\e[0m"

## Replacing old config with new and setting up the system

# Make directory to store backup config
mkdir -v $BACKUP

# alacritty
if [ -d $ALACRITTY ]; then
    mv -v $ALACRITTY $BACKUP
fi

cp -rv $DOT/.config/alacritty $CONFIG

# bat
if [ -d $BAT ]; then
    mv -v $BAT $BACKUP
fi

cp -rv $DOT/.config/bat $CONFIG

# cava
if [ -d $CAVA ]; then
    mv -v $CAVA $BACKUP
fi

cp -rv $DOT/.config/cava $CONFIG

# dunst
if [ -d $DUNST ]; then
    mv -v $DUNST $BACKUP
fi

cp -rv $DOT/.config/dunst $CONFIG

# fish
if [ -d $FISH ]; then
    mv -v $FISH $BACKUP
fi

cp -rv $DOT/.config/fish $CONFIG

# installing omf
if [ -d "$HOME/oh-my-fish" ]; then
    mv -v $HOME/oh-my-fish $BACKUP
fi

git clone https://github.com/oh-my-fish/oh-my-fish $HOME/oh-my-fish
fish -c "$HOME/oh-my-fish/bin/install --offline"

fish -c fish_update_completions
fish -c omf update
fish -c omf install agnoster
fish -c omf install thefuck
fish -c omf install weather
fish -c omf install spark

# i3
if [ -d $I3 ]; then
    mv -v $I3 $BACKUP
fi

cp -rv $DOT/.config/i3 $CONFIG

# i3blocks
if [ -d $I3B ]; then
    mv -v $I3B $BACKUP
fi

cp -rv $DOT/.config/i3blocks $CONFIG

# i3status
if [ -d $I3S ]; then
    mv -v $I3S $BACKUP
fi

cp -rv $DOT/.config/i3status $CONFIG

# kitty
if [ -d $KITTY ]; then
    mv -v $KITTY $BACKUP
fi

cp -rv $DOT/.config/kitty $CONFIG

# polybar
if [ -d $PB ]; then
    mv -v $PB $BACKUP
fi

cp -rv $DOT/.config/polybar $CONFIG

# rofi
if [ -d $ROFI ]; then
    mv -v $ROFI $BACKUP
fi

cp -rv $DOT/.config/rofi $CONFIG

sudo cp -rv $DOT/nord.rasi /usr/share/rofi/themes/

# spicetify
if [ -d $SPTFY ]; then
    mv -v $SPTFY $BACKUP
fi

cp -rv $DOT/.config/spicetify $CONFIG

sudo chmod -v a+wr /opt/spotify
sudo chmod -v a+wr /opt/spotify/Apps -R

spicetify apply

# vis
if [ -d $VIS ]; then
    mv -v $VIS $BACKUP
fi

cp -rv $DOT/.config/vis $CONFIG

# zathura
if [ -d $ZT ]; then
    mv -v $ZT $BACKUP
fi

cp -rv $DOT/.config/zathura $CONFIG

# betterlockscreen-12hr
if [ -d $BLS ]; then
    mv -v $BLS $BACKUP
fi

git clone htttps://github.com/Nonanonymous24/betterlockscreen-12hr.git $BLS

# startpage_3
if [ -d $SP ]; then
    mv -v $SP $BACKUP
fi

cp -rv $DOT/chrome_nord_theme.crx $HOME

# Wallpaper
if [ -d $PIC ]; then
    cp -rv $DOT/Wallpaper/paul-gilmore-KT3WlrL_bsg-unsplash.jpg $PIC
else
    mkdir -v $PIC
    cp -rv $DOT/Wallpaper/paul-gilmore-KT3WlrL_bsg-unsplash.jpg $PIC
fi

./$BLS/betterlockscreen -u $PIC/paul-gilmore-KT3WlrL_bsg-unsplash.jpg

# .bashrc
if [ -f $BASHRC ]; then
    mv -v $BASHRC $BACKUP
fi

cp -rv $DOT/.bashrc $HOME

# tmux
if [ -f $TMUX ]; then
    mv -v $TMUX $BACKUP
fi

cp -rv $DOT/.tmux.conf $HOME

## install tpm
if [ -d "$HOME/.tmux" ]; then
    mv -v $HOME/.tmux $BACKUP
fi
    
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

# vim
if [ -f $VIMRC ]; then
    mv -v $VIMRC $BACKUP
fi

cp -rv $DOT/.vimrc $HOME

## vim plugins 
if [ -d "$HOME/.vim" ]; then
    mv -v $HOME/.vim $BACKUP
fi

git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

fish -c omf install vundle

uwu

