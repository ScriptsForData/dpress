#!/bin/bash
# Script to decompress files for rar or zip entension using unzip and unrar tool.
# Standoge 28-06-22

RARFILES='^.+\.rar$'
ZIPFILES='^.+\.zip$'
				
 if [[ $1 =~ $RARFILES ]]; then

	unrar x $1

 elif [[ $1 =~ $ZIPFILES ]]; then

	unzip $1

fi

