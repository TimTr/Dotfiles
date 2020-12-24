#!/bin/zsh
#
# macos-system.sh - macos-system

# Import the default functions used in these scripts
source ${DOTFILES_ROOT}/template/dot-source.sh
status "install-system.sh - start" "Configuring shell and OS settings."


#### Switch to`zsh` if not already using it
if [ "$SHELL" != "/bin/zsh" ]; then
  error "SHELL is not set to ZSH" "Switching to ZSH - needs authentication"
  chsh -s $(which zsh)
fi

# Copy the dotfiles to the $HOME folder (copies over any existing files)
cp ${DOTFILES_ROOT}/macos-shell/aliases.sh $HOME/.aliases
cp ${DOTFILES_ROOT}/macos-shell/functions.sh $HOME/.functions
cp ${DOTFILES_ROOT}/macos-shell/zprofile.sh $HOME/.zprofile
cp ${DOTFILES_ROOT}/macos-shell/zshrc.sh $HOME/.zshrc

cp ${DOTFILES_ROOT}/macos-shell/test.sh ${DEVELOPER_BIN}/
sudo chmod -R 777 ${DEVELOPER_BIN}/*


# ==============================================================================
status "install-system.sh - done." "Returning to parent script."
exit 0


