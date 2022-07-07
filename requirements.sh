#!/bin/bash
# Script to install tools that are necessary to run dpress.sh script

OS=$(uname -r)
ARCHREG='^.+arch.+$'
UBUNTUREG='^.+ubuntu.+$'
DEBIANREG='^.+debian.+$'

if [[ $OS =~ $ARCHREG ]]; then
  sudo pacman -S unzip unrar
elif [[ $OS =~ $UBUNTUREG || $OS =~ $DEBIANREG ]]; then
  sudo apt install unzip unrar
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



