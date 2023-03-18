inspect_args
source_file="${args[file]}"
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
echo "Compressing $source_file"
# compressFiles () {
#     if [[ $source_file =~ $RARFILES ]]; then

#         rar a -r "$1" "$2"

#         elif [[ $source_file =~ $ZIPFILES ]]; then

#         zip -r "$source_file" "$target_file"

#         elif [[ $source_file =~ $TARFILES ]]; then

#         tar -zcvf "$1" "$2"

#         elif [[ $source_file =~ $XZFILES ]]; then

#         tar cJvf "$1" "$2"

#     fi
# }