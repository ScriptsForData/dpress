#!/bin/bash
# Script to decompress files for rar or zip entension using unzip and unrar tool.
# Standoge 28-06-22

RARFILES='^.+\.rar$'
ZIPFILES='^.+\.zip$'
TARFILES='^.+\.tar\.gz$'
ARGUMENT='^-.+$'

if [[ $1 =~ $ARGUMENT  ]]; then
  case "$1" in
    -l)
       if [[ $2 =~ $RARFILES ]]; then

        unrar l $2

       elif [[ $2 =~ $ZIPFILES ]]; then

        unzip -l $2

       elif [[ $2 =~ $TARFILES ]]; then

        tar -xzvfl $1 

       fi
    ;;
    -d)
      if [[ $# -ne 3 ]]; then
        echo "Expected argument were not given, you've to follow this syntax:
        <dpress -d file.extension directory>"

      else
       if [[ $2 =~ $RARFILES ]]; then

        unrar $2 ad $3

       elif [[ $2 =~ $ZIPFILES ]]; then

        unzip $2 -d $3

       elif [[ $2 =~ $TARFILES ]]; then

        tar -xf $2 --directory $3

       fi
      fi
    ;;
    *) echo -e "Note: Select a valid argument\n " 
       echo -e "-l: To list files before to decompress\n
-d: To put a thid argument at end with path for output\n
none: To decompress on current directory" 
    ;;
  esac
else 
       if [[ $1 =~ $RARFILES ]]; then

        unrar x $1

       elif [[ $1 =~ $ZIPFILES ]]; then

        unzip $1

       elif [[ $1 =~ $TARFILES ]]; then

        tar -xzvf $1 

      else
        echo "Note: You must select a compressed file"
       fi
fi
