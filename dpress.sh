#!/bin/bash
# Script to decompress files for rar or zip entension using unzip and unrar tool.
# Standoge 28-06-22

RARFILES='^.+\.rar$'
ZIPFILES='^.+\.zip$'
ARGUMENT='^-.+$'

if [[ $1 =~ $ARGUMENT  ]]; then
  case "$1" in
    -l)
       if [[ $2 =~ $RARFILES ]]; then

        unrar l $2

       elif [[ $2 =~ $ZIPFILES ]]; then

        unzip -l $2

       fi
    ;;
    -d)
       if [[ $2 =~ $RARFILES ]]; then

        unrar $2 ad $3

       elif [[ $2 =~ $ZIPFILES ]]; then

        unzip $2 -d $3

       fi
    ;;
    *)
       if [[ $1 =~ $RARFILES ]]; then

        unrar x $1

       elif [[ $1 =~ $ZIPFILES ]]; then

        unzip $1

       fi
    ;;
  esac
else 
       if [[ $1 =~ $RARFILES ]]; then

        unrar x $1

       elif [[ $1 =~ $ZIPFILES ]]; then

        unzip $1

       fi
fi


