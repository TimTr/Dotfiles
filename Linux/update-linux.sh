#!/bin/zsh
#
# update-shell.sh

# Import the default functions used in these scripts
source $(dirname $0)/functions.sh
status "update-shell.sh" "Configuring shell and OS settings."


#### Switch to ZSH if not already using it
if [ "$SHELL" != "/bin/zsh" ]; then
  error "SHELL is not set to ZSH" "Switching to ZSH - needs authentication"
  chsh -s $(which zsh)
fi

# Copy the dotfiles to the $HOME folder (copies over any existing files)
cp ${DOTFILES_ROOT}/Mac/aliases.sh $HOME/.aliases
cp ${DOTFILES_ROOT}/Mac/functions.sh $HOME/.functions
cp ${DOTFILES_ROOT}/Mac/zshrc.sh $HOME/.zshrc
# cp ${DOTFILES_ROOT}/Mac/zprofile.sh $HOME/.zprofile

cp ${DOTFILES_ROOT}/Mac/test.sh ${DEVELOPER_BIN}/
sudo chmod -R 777 ${DEVELOPER_BIN}/*


# Hard code the critical source folders into the ~/.zshrc file
echo " " >> ~/.zshrc
echo "# ============================================================" >> ~/.zshrc
echo "# Hard coded variables used by dot installer scripts " >> ~/.zshrc
echo " " >> ~/.zshrc
echo "export DOTFILES_ROOT=$DOTFILES_ROOT" >> ~/.zshrc
echo "export DEVELOPER_HOME=$DEVELOPER_HOME" >> ~/.zshrc
echo "export DEVELOPER_BIN=$DEVELOPER_BIN" >> ~/.zshrc




# ==============================================================================
exit 0


