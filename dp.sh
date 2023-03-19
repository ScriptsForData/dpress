#!/bin/bash -e
# Script to handle files in .rar, .zip or .tar extension unifing syntaxis for all tools.
# Standoge 28-06-22

RARFILES='^.+\.rar$'
ZIPFILES='^.+\.zip$'
TARFILES='^.+\.tar\.gz$'
XZFILES='^.+\.tar\.xz$'
ARGUMENT='^-.+$'



#######################################
# Compress file in current directory
# Globals:
#   RARFILES
#   ZIPFILES
#   TARFILES
# Arguments:
#   Name of new compressed file
#   Name of file to compress
# Outputs:
#   None
#######################################
compressFiles () {
    if [[ $1 =~ $RARFILES ]]; then
        
        rar a -r "$1" "$2"
        
        elif [[ $1 =~ $ZIPFILES ]]; then
        
        zip -r "$1" "$2"
        
        elif [[ $1 =~ $TARFILES ]]; then
        
        tar -zcvf "$1" "$2"
        
        elif [[ $1 =~ $XZFILES ]]; then
        
        tar cJvf "$1" "$2"
        
    fi
}


# Main entry point
if [[ $1 =~ $ARGUMENT ]]; then
    case "$1" in
        -l)
            listFiles "$2"
        ;;
        -c)
            if [[ $# -ne 3 ]]; then
                echo "Expected argument were not given, you've to follow this syntax:
                <dpress -d file.extension directory>"
      else
        compressFiles "$2" "$3"
      fi
     ;;
    -d)
      if [[ $# -ne 3 ]]; then
                echo "Expected argument were not given, you've to follow this syntax:
                <dpress -d file.extension directory>"
                
            else
                decompressAnotherDir "$2" "$3"
                rm -rf "$2"
            fi
        ;;
    -r)
      if [[ $# -ne 2 ]]; then
                echo "Expected argument were not given, you've to follow this syntax:
                <dpress -m file.txt>"
                
            else
                file_text=$2
                while read LINE; do
                   decompress "$LINE" 
                done < "$file_text"
            fi
        ;;
    *) echo "Error: Select a valid argument.
        -l: To list files before to decompress
        -d: To put a thid argument at end with path for output
        none: To decompress on current directory"
        ;;
    esac
else
    
    decompress "$1"
    rm -r "$1"
    
fi