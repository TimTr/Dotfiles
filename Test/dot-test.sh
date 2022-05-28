#!/bin/zsh
#
# This script is designed for trying out ideas before moving
# code into one of the production scripts.


# This script will run either the Linux or macOS install version
if [[ $OSTYPE == darwin* ]];
then
  echo "I am a Mac" ;
else
  echo "I am NOT a Mac (apparently)" ;
fi


# Source in functions such as message, alert, error, and bullet
source $PWD/shell/functions.sh

message "$#" "= total number of arguments passed"

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



alert "./dot-test.sh - done." 



