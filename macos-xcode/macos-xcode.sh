#!/bin/zsh
#
# macos-xcode.sh

# Import the default functions used in these scripts
source ${DOTFILES_ROOT}/template/dot-source.sh
status "macos-xcode.sh - start" "Configuring Xcode settings"


#### Copy all the Xcode colors and themes -- requires re-launch
#       NOTE: Do not copy the Xcode .plist as that breaks account settings (GitHub etc.)
mkdir -p ${HOME}/Library/Developer/Xcode/UserData/FontAndColorThemes 2> /dev/null

cp ${DOTFILES_ROOT}/macos-xcode/*.xccolortheme \
   ${HOME}/Library/Developer/Xcode/UserData/FontAndColorThemes/




# ==============================================================================
status "install-xcode.sh - done." "Returning to parent script."
exit 0
