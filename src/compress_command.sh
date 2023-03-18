inspect_args
source_file="${args[source]}"
target_file="${args[target]}"
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
    if [[ $source_file =~ $RARFILES ]]; then
        
        rar a -r "$source_file" "$target_file"
        
        elif [[ $source_file =~ $ZIPFILES ]]; then
        
        zip -r "$source_file" "$target_file"
        
        elif [[ $source_file =~ $TARFILES ]]; then
        
        tar -zcvf "$source_file" "$target_file"
        
        elif [[ $source_file =~ $XZFILES ]]; then
        
        tar cJvf "$source_file" "$target_file"
        
    fi
}

compressFile "$source_file" "$target_file"