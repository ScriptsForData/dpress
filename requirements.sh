#!/bin/bash
# Script to install tools that are necessary to run dpress.sh script

case $1 in
    -debian|-ubuntu) sudo apt install unzip unrar
    ;;
    -arch) sudo pacman -S unzip unrar
    ;;
    -mac) brew  install rar && brew install unzip
    ;;
    *) echo "NOTE: Select some argument to use a
        package manager and install the requirements"
esac



