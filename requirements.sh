#!/bin/bash
# Script to install tools that are necessary to run dpress.sh script

OS=$(uname -r)
ARCHREG='^.+arch.+$'
UBUNTUREG='^.+ubuntu.+$'
DEBIANREG='^.+debian.+$'
WSL='(\d+\.)+\d+-[a-z]+-[a-z]+-[A-Z]+\d'

if [[ $OS =~ $ARCHREG ]]; then
    sudo pacman -S unzip unrar xz
    elif [[ $OS =~ $UBUNTUREG || $OS =~ $DEBIANREG || $OS =~ $WSL ]]; then
    sudo apt install unzip unrar xz
fi


# ╭──────────────────────────────────────────────────────────╮
# │ case $1 in                                               │
# │   -debian|-ubuntu) sudo apt install unzip unrar          │
# │   ;;                                                     │
# │   -arch) sudo pacman -S unzip unrar                      │
# │   ;;                                                     │
# │   -mac) brew  install rar && brew install unzip          │
# │   ;;                                                     │
# │   *) echo "NOTE: Select some argument to use a           │
# │  package manager and install the requirements"           │
# │ esac                                                     │
# ╰──────────────────────────────────────────────────────────╯



