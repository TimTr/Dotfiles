#!/bin/zsh
#
# update-settings.sh
#
# Source ~/.functions so we have functions like "status" and "message"
source ${HOME}/.functions
status "udpate-settings.sh" "Configuring app and tool settings"


# copy settings to $HOME root
cp ${DOTFILES_ROOT}/macos-settings/gitconfig.dotfile $HOME/.gitconfig
cp ${DOTFILES_ROOT}/macos-settings/gitignore.dotfile $HOME/.gitignore

# copy Terminal and other plists to $HOME/Library/Preferences
cp ${DOTFILES_ROOT}/macos-settings/*.plist $HOME/Library/Preferences


# ==============================================================================
exit 0


