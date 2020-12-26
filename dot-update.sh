#!/bin/zsh
#
# dot-update.sh

source ${HOME}/.functions
source ${HOME}/.aliases

# determine the filename for the called file (e.g. update or dot)
MYNAME=`basename "$0"`

# ZSH syntax to confirm DOTFILES_ROOT is set, otherwise abort with an error
if [[ -v DOTFILES_ROOT ]]; then
  status "$MYNAME" "Updating settings and latest software"
else
  echo "!! ABORTING: Run dot-install.sh from \"dotfiles\" and restart Terminal"
  exit 0
fi


# If this is not run as "dot" most likely it isn't setup, so re-connect it
if [ "$MYNAME" != "dot" ]; then
  error "$MYNAME" "FYI: Use \"dot\" via the PATH to update at any time"
  
  # Add a symlink to the dot-update.sh file at the root here
  rm ${DEVELOPER_BIN}/dot 2> /dev/null
  ln -s ${DOTFILES_ROOT}/dot-update.sh ${DEVELOPER_BIN}/dot
  sudo chmod -R 777 ${DEVELOPER_BIN}/*
fi


message "Done updating" "Restart Terminal.app for changes to take effect"

exit 0

