#!/bin/bash
# Script to decompress files for rar or zip entension using unzip and unrar tool.
# Standoge 28-06-22

RARFILES='^.+\.rar$'
ZIPFILES='^.+\.zip$'
ARGUMENT='^-.$'
option=''

if [[ $1 =~ $ARGUMENT  ]]; then
  $option=$1
fi

case $option in
  -l)
     if [[ $2 =~ $rarfiles ]]; then

      unrar l $2

     elif [[ $2 =~ $zipfiles ]]; then

      unzip -l $2

     fi
  ;;
  -d)
     if [[ $2 =~ $rarfiles ]]; then

      unrar $2 ad $3

     elif [[ $2 =~ $zipfiles ]]; then

      unzip $2 -d $3

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

