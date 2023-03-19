target="${args[target]}"
source="${args[source]}"
#######################################
# Compress file in current directory
# Globals:
#   RARFILES
#   ZIPFILES
#   TARFILES
# Arguments:
#   $source: Name of file to compress
#   $target: 
# Outputs:
#   None
#######################################
compressFile () {
    if [[ $target =~ $RARFILES ]]; then
        
        rar a -r "$target " "$source"
        
        elif [[ $target =~ $ZIPFILES ]]; then
        
        zip -r "$target " "$source"
        
        elif [[ $target =~ $TARFILES ]]; then
        
        tar -zcvf "$target " "$source"
        
        elif [[ $target =~ $XZFILES ]]; then
        
        tar cJvf "$target " "$source"
        
    fi
}

compressFile "$target " "$source"