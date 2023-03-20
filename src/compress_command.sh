target="${args[target]}"
source="${args[source]}"
to_delete="${args[--del]}"
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
        
        rar a -r "$target" "$source"

        if [[ $to_delete ]]; then
            rm -r "$source"
        fi
        
        elif [[ $target =~ $ZIPFILES ]]; then
        
        zip -r "$target" "$source"

        if [[ $to_delete ]]; then
            rm -r "$source"
        fi
        
        elif [[ $target =~ $TARFILES ]]; then
        
        tar -zcvf "$target" "$source"

        if [[ $to_delete ]]; then
            rm -r "$source"
        fi
        
        elif [[ $target =~ $XZFILES ]]; then
        
        tar cJvf "$target" "$source"

        if [[ $to_delete ]]; then
            rm -r "$source"
        fi
        
    fi
}

compressFile "$target" "$source"