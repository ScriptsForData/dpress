#!/bin/bash
# Script to decompress files for rar or zip entension using unzip and unrar tool.
# Standoge 28-06-22

RARFILES='^.+\.rar$'
ZIPFILES='^.+\.zip$'
				

case $1 in
  -l)
     if [[ $1 =~ $rarfiles ]]; then

      unrar l $1

     elif [[ $1 =~ $zipfiles ]]; then

      unzip -l $1

     fi
  ;;
  -d)
     if [[ $1 =~ $rarfiles ]]; then

      unrar $1 ad $2

     elif [[ $1 =~ $zipfiles ]]; then

      unzip $1 -d $2

     fi
  ;;
  *)
     if [[ $1 =~ $rarfiles ]]; then

      unrar x $1

     elif [[ $1 =~ $zipfiles ]]; then

      unzip $1

     fi

  ;;
esac
