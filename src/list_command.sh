source_file=${args[source]}

#######################################
# List files inside compressed file.
# Globals:
#   RARFILES
#   ZIPFILES
#   TARFILES
# Arguments:
#   Name of compressed file
# Outputs:
#   Writes files that are beging decompressed to stdout.
#######################################
listFiles () {
    if [[ $source_file =~ $RARFILES ]]; then
        
        unrar l "$source_file"
        
        elif [[ $source_file =~ $ZIPFILES ]]; then
        
        unzip -l "$source_file"
        
        elif [[ $source_file =~ $TARFILES ]]; then
        
        tar -ztvf "$source_file"
        
        elif [[ $source_file =~ $XZFILES ]]; then
        
        tar tvf "$source_file"
        
    fi
}

listFiles "$source_file"