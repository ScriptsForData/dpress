#!/bin/bash
# Script to decompress files for rar or zip entension using unzip and unrar tool.
# Standoge 28-06-22

RARFILES='^.+\.rar$'
ZIPFILES='^.+\.zip$'
TARFILES='^.+\.tar\.gz$'
ARGUMENT='^-.+$'

listFiles () {  
       if [[ $1 =~ $RARFILES ]]; then

        unrar l $1

       elif [[ $1 =~ $ZIPFILES ]]; then

        unzip -l $1

       elif [[ $1 =~ $TARFILES ]]; then

        tar -xzvfl $1 

       fi
}

decompressAnotherDir () {
       if [[ $1 =~ $RARFILES ]]; then

        unrar e $1 $2

       elif [[ $1 =~ $ZIPFILES ]]; then

        unzip $1 -d $2

       elif [[ $1 =~ $TARFILES ]]; then

        tar -xf $1 --directory $2

       fi
}

onliDecompress () {
       if [[ $1 =~ $RARFILES ]]; then

        unrar x $1

       elif [[ $1 =~ $ZIPFILES ]]; then

        unzip $1

       elif [[ $1 =~ $TARFILES ]]; then

        tar -xzvf $1 

      else
        echo "Note: You must select a compressed file"
      fi
}


if [[ $1 =~ $ARGUMENT  ]]; then
  case "$1" in
    -l)

      listFiles $2 
    ;;

    -d)
      if [[ $# -ne 3 ]]; then
        echo "Expected argument were not given, you've to follow this syntax:
        <dpress -d file.extension directory>"

      else
        decompressAnotherDir $2 $3
      fi

    ;;
    *) echo -e "Note: Select a valid argument\n " 
       echo -e "-l: To list files before to decompress\n
-d: To put a thid argument at end with path for output\n
none: To decompress on current directory" 

    ;;
  esac
else 

  onliDecompress $1

fi