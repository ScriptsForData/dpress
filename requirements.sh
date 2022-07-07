#!/bin/bash
# Script to install tools that are necessary to run dpress.sh script

OS=$(uname -r)
ARCHREG='^.+arch.+$'
ARCHREG='^.+ubuntu.+$'
ARCHREG='^.+debian.+$'

case $1 in
  -debian|-ubuntu) sudo apt install unzip unrar
  ;;
  -arch) sudo pacman -S unzip unrar  
  ;;
  -mac) brew  install rar && brew install unzip
  ;;
  *) echo "NOTE: Select some argument to use a package manager and install the requirements"
esac



