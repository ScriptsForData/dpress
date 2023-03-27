source=${args[source]}
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
    if [[ $source =~ $RARFILES ]]; then
        unrar l "$source"
    elif [[ $source =~ $ZIPFILES ]]; then
        unzip -l "$source"
    elif [[ $source =~ $TARFILES ]]; then
        tar -ztvf "$source"
    elif [[ $source =~ $XZFILES ]]; then
        tar tvf "$source"
    fi
}

listFiles "$source"