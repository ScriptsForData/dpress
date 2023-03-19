source="${args[source]}"
target="${args[target]}"
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
compressFile () {
    if [[ $source =~ $RARFILES ]]; then
        
        rar a -r "$source" "$target"
        
        elif [[ $source =~ $ZIPFILES ]]; then
        
        zip -r "$source" "$target"
        
        elif [[ $source =~ $TARFILES ]]; then
        
        tar -zcvf "$source" "$target"
        
        elif [[ $source =~ $XZFILES ]]; then
        
        tar cJvf "$source" "$target"
        
    fi
}

compressFile "$source" "$target"