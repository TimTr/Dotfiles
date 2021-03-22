#!/bin/zsh
#
# dot-test.sh - This script is designed for trying out ideas before moving
#               code into one of the production scripts.
#



# Source in functions such as message, status, error, and bullet
source $PWD/shell/functions.sh

status "$#" "= total number of arguments passed"

# First make sure the installer is run from within the dotfiles folder
if [ "$(basename "$PWD")" != "dotfiles" ]; then
  error "ABORT" "You must run the installer from within the dotfiles folder"
  exit 0
fi

# Handle parameters from the command line - e.g. "update"
if [ "$1" = "install" ]; then
  message "Install" "You selected to run the INSTALL version of the script"
  exit 0
fi

if [ "$1" = "update" ]; then
  message "Update" "You selected to run the UPDATE version of the script"
  exit 0
fi



status "./dot-test.sh - done." "Exiting.\n"



