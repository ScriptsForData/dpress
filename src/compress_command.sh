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
#   $target: Name of new compressed file
#######################################
compressFile () {
    if [[ $target =~ $RARFILES ]]; then
        rar a -r "$target" "$source"
    elif [[ $target =~ $ZIPFILES ]]; then
        zip -r "$target" "$source"
    elif [[ $target =~ $TARFILES ]]; then
        tar -zcvf "$target" "$source"
    elif [[ $target =~ $XZFILES ]]; then
        tar cJvf "$target" "$source"
    fi
    if [[ $to_delete ]]; then
        rm -r "$source"
    fi
}

compressFile "$target" "$source"