#!/bin/bash
# Script to decompress files for rar or zip entension using unzip and unrar tool.
# Standoge 28-06-22

RARFILES='^.+\.rar$'
ZIPFILES='^.+\.zip$'
TARFILES='^.+\.tar\.gz$'
XZFILES='^.+\.tar\.xz$'
ARGUMENT='^-.+$'

# List files before to decompress
listFiles () {  
       if [[ $1 =~ $RARFILES ]]; then

        unrar l $1

       elif [[ $1 =~ $ZIPFILES ]]; then

        unzip -l $1

       elif [[ $1 =~ $TARFILES ]]; then

        tar -ztvf $1 

       fi
}

# Decompress files in another directory
decompressAnotherDir () {
       if [[ $1 =~ $RARFILES ]]; then

        unrar e $1 $2

       elif [[ $1 =~ $ZIPFILES ]]; then

        unzip $1 -d $2

       elif [[ $1 =~ $TARFILES ]]; then

        tar -xf $1 --directory $2

       fi
}

# Create a compressed file, regarding their name and extension it will use the 
# correct tool.
compressFiles () {
       if [[ $1 =~ $RARFILES ]]; then

        rar a $1 $2

       elif [[ $1 =~ $ZIPFILES ]]; then

        zip -r $1 $2

       elif [[ $1 =~ $TARFILES ]]; then

        tar -zcvf $1 $2

       elif [[ $1 =~ $XZFILES]]; then

        tar cJvf $1 $2

       fi
}

# Decompress files in current directory
decompress () {
       if [[ $1 =~ $RARFILES ]]; then

        unrar x $1

       elif [[ $1 =~ $ZIPFILES ]]; then

        unzip $1

       elif [[ $1 =~ $TARFILES ]]; then

        tar -xzvf $1 

       elif [[ $1 =~ $XZFILES]]; then

        tar xvf $1

      else
        echo "Note: You must select a compressed file"
      fi
}


if [[ $1 =~ $ARGUMENT  ]]; then
  case "$1" in
    -l)

      listFiles $2 
    ;;
    -c)
      if [[ $# -ne 3 ]]; then
        echo "Expected argument were not given, you've to follow this syntax:
        <dpress -d file.extension directory>"

      else
        compressFiles $2 $3
      fi
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

  decompress $1

fi
