#!/bin/zsh
#
# dot-update.sh

source ${HOME}/.functions
source ${HOME}/.aliases

# determine the filename for the called file (e.g. "dot-update.sh" or "dot")
MYNAME=(basename "$0")

# ==============================================================================
# Confirm DOTFILES_ROOT is set, otherwise abort with an error
if [[ -v DOTFILES_ROOT ]]; then
  status "$MYNAME" "Updating settings - DOTFILES_ROOT = ${DOTFILES_ROOT}"
else
  echo "!! ABORTING: DOTFILES_ROOT is not properly setup"
  echo "             Run dot-install.sh from \"dotfiles\" and restart Terminal"
  exit 0
fi


# ==============================================================================
# If this is not run as "dot" most likely it isn't setup, so re-connect it
if [ "$MYNAME" != "dot" ]; then
  error "$MYNAME" "FYI: Use \"dot\" via the PATH to update at any time"
  
  # Add a symlink to the dot-update.sh file at the root here
  rm ${DEVELOPER_BIN}/dot 2> /dev/null
  ln -s ${DOTFILES_ROOT}/dot-update.sh ${DEVELOPER_BIN}/dot
  sudo chmod -R 777 ${DEVELOPER_BIN}/*
fi

# Install each of the sub-sections
# ${DOTFILES_ROOT}/macos-shell/udpate-shell.sh
# ${DOTFILES_ROOT}/macos-settings/update-settings.sh
# ${DOTFILES_ROOT}/macos-xcode/update-xcode.sh
# ${DOTFILES_ROOT}/macos-vscode/update-vscode.sh
# ${DOTFILES_ROOT}/macos-homebrew/update-homebrew.sh
${DOTFILES_ROOT}/macos-ruby/update-ruby.sh






message "Done updating" "Restart Terminal.app for changes to take effect"

exit 0

