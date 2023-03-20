source="${args[source]}"
target="${args[target]}"
to_delete="${args[--del]}"
#######################################
# Decompress files in current directory
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
extract () {
    if [[ $source =~ $RARFILES ]]; then
        
        unrar x "$source" > /dev/null

        if [[ $to_delete ]]; then
            rm "$source"
        fi
        
        elif [[ $source =~ $ZIPFILES ]]; then
        
        unzip "$source" > /dev/null

        if [[ $to_delete ]]; then
            rm "$source"
        fi
        
        elif [[ $source =~ $TARFILES || $1 =~ $XZFILES ]]; then
        
        tar -xzvf "$source" > /dev/null

        if [[ $to_delete ]]; then
            rm "$source"
        fi
        
    else
        echo "Note: You must select a compressed file"
    fi
}

#######################################
# Decompress files in another directory.
# Globals:
#   RARFILES
#   ZIPFILES
#   TARFILES
# Arguments:
#   Name of compressed file
#   Name of directory to decompress files to
# Outputs:
#   None
#######################################
extractAnotherDir() {
    if [[ $source =~ $RARFILES ]]; then
        
        unrar e "$source" "$target"

        if [[ $to_delete ]]; then
            rm "$source"
        fi
        
        elif [[ $source =~ $ZIPFILES ]]; then
        
        unzip "$source" -d "$target"

        if [[ $to_delete ]]; then
            rm "$source"
        fi
        
        elif [[ $source =~ $TARFILES || $1 =~ $XZFILES ]]; then
        
        tar -xf "$source" --directory "$target"
        
        if [[ $to_delete ]]; then
            rm "$source"
        fi
        
    fi
}

if [[ $target ]]; then
		extractAnotherDir "$source" "$target"
else
		extract "$source"
fi