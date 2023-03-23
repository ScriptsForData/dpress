source="${args[source]}"
target="${args[target]}"
to_delete="${args[--del]}"
#######################################
# Extract files in current directory
# Globals:
#   RARFILES
#   ZIPFILES
#   TARFILES
# arguments:
#   $source: name of compressed file to extract
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
# Extract files in another directory.
# Globals:
#   RARFILES
#   ZIPFILES
#   TARFILES
# Arguments:
#   $source: name of compressed file to extract
#   $target: name of directory to extract files to
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