#!/bin/zsh
#
# dot-update.sh

source ${HOME}/.functions
source ${HOME}/.aliases

# determine the filename for the called file (just filename, not full path)
MYNAME="$(basename "$0")"

# ==============================================================================
# Confirm DOTFILES_ROOT is set, otherwise abort with an error
if [[ -v DOTFILES_ROOT ]]; then
  message "$MYNAME" "DOTFILES_ROOT = ${DOTFILES_ROOT}"
else
  echo "!! ABORTING: DOTFILES_ROOT is not properly setup"
  echo "             Run dot-install.sh from \"dotfiles\" and restart Terminal"
  exit 0
fi


# ==============================================================================
# If this is not run as "dot" most likely it isn't setup, so re-connect it
if [ "$MYNAME" != "dot" ]; then
  error "Launched as $MYNAME" "Setting up \"dot\" to re-run via PATH any time"

  # Re-add a symlink to the dot-update.sh file at the root here
  rm -f ${DEVELOPER_BIN}/dot &> /dev/null
  ln -s ${DOTFILES_ROOT}/dot-update.sh ${DEVELOPER_BIN}/dot &> /dev/null
  sudo chmod -R 777 ${DEVELOPER_BIN}/* &> /dev/null
fi

message "Running sub-scripts" "Launching each of the update scripts"
# Update each of the sub-sections - NOTE: THIS IS BROKEN
${DOTFILES_ROOT}/macos-shell/update-shell.sh
${DOTFILES_ROOT}/macos-settings/update-settings.sh
${DOTFILES_ROOT}/macos-xcode/update-xcode.sh
${DOTFILES_ROOT}/macos-vscode/update-vscode.sh
${DOTFILES_ROOT}/macos-homebrew/update-homebrew.sh
${DOTFILES_ROOT}/macos-ruby/update-ruby.sh






message "Done updating" "Restart Terminal.app for changes to take effect"

exit 0

