source="${args[source]}"
target="${args[target]}"
to_delete="${args[--del]}"
is_recursive="${args[--re]}"
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
    elif [[ $source =~ $ZIPFILES ]]; then
        unzip "$source" > /dev/null
    elif [[ $source =~ $TARFILES || $1 =~ $XZFILES ]]; then
        tar -xzvf "$source" > /dev/null
    fi
    if [[ $to_delete ]]; then
            rm "$source"
    fi
}

extractRecursively () {
    if [[ $source =~ $TXT ]]; then
        while read line; do
            if [[ $line =~ $RARFILES ]]; then
                unrar x "$line" > /dev/null
            elif [[ $line =~ $ZIPFILES ]]; then
                unzip "$line" > /dev/null
            elif [[ $line =~ $TARFILES || $1 =~ $XZFILES ]]; then
                tar -xzvf "$line" > /dev/null
            fi
            if [[ $to_delete ]]; then
                rm "$line"
            fi
        done < "$source"
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
    elif [[ $source =~ $ZIPFILES ]]; then
        unzip "$source" -d "$target"
    elif [[ $source =~ $TARFILES || $1 =~ $XZFILES ]]; then
        tar -xf "$source" --directory "$target"
    fi
}

if [[ $target ]]; then
		extractAnotherDir "$source" "$target"
fi
if [[ $is_recursive  ]]; then
        extractRecursively "$source"
else
		extract "$source"
fi