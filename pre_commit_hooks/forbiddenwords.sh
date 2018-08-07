#!/bin/bash

# Bash PHP Forbidden Words Hook
#
# Exit 0 if no errors found
# Exit 1 if errors were found
#
# Requires
# - grep
#
# Arguments
# - None

# Echo Colors
msg_color_yellow='\033[0;33m'
msg_color_none='\033[0m' # No Color

# Loop through the list of paths to run php codesniffer against
echo -en "${msg_color_yellow}Searching for forbidden words ...${msg_color_none} \n"

phpstan_files_to_check="${@:2}"

grep -e 'var_dump(' -e 'print_r(' -e 'die(' $phpstan_files_to_check
if [ "$?" = "0" ]; then
    exit 0
fi

exit 1
