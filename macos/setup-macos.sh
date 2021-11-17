#!/bin/zsh
#
# setup-macos.sh - the macOS version
source "$DOTFILES_ROOT/macos/functions.sh"
echo
status "setup-macos.sh -- setting up for macOS"
echo
message "Installed Xcode?" "Before proceeding, Xcode or CL tools must be installed"
read -s -k $'?Press any key to continue. Hit Control-C to abort now.\n'


## Report that we are in the right source folder for the dotfiles
message "$DOTFILES_ROOT" "Global variable points to source dotfiles folder"


# ==============================================================================
message "Requires SUDO" "Setting source file permissions and ownership"
sudo chown -R $USER ${DOTFILES_ROOT}/* 2> /dev/null
sudo chmod -R 777 ${DOTFILES_ROOT}/* 2> /dev/null

# Un-set the quarantine bit for all my own script files
xattr -d com.apple.quarantine ${DOTFILES_ROOT}/* 2> /dev/null


# ==============================================================================
message "mkdir -p" "Adding: /opt/bin, /opt/homebrew/bin, /usr/local/bin"
sudo mkdir -p /opt/bin
sudo mkdir -p /opt/homebrew/bin
sudo mkdir -p /usr/local/bin

sudo chmod 777 /opt/bin
sudo chmod 777 /opt/homebrew/bin
sudo chmod 777 /usr/local/bin

sudo chown -R "$USER":admin /opt/bin/*
sudo chown -R "$USER":admin /opt/homebrew/*
sudo chown -R "$USER":admin /usr/local/*


# ==============================================================================
message "Copying dotfiles" "Overwriting existing versions of these files"
cp $DOTFILES_ROOT/macos/zshrc.sh $HOME/.zshrc
cp $DOTFILES_ROOT/macos/zprofile.sh $HOME/.zprofile
cp $DOTFILES_ROOT/macos/aliases.sh $HOME/.aliases
cp $DOTFILES_ROOT/macos/exports.sh $HOME/.exports
cp $DOTFILES_ROOT/macos/functions.sh $HOME/.functions
cp $DOTFILES_ROOT/macos/inputrc.sh $HOME/.inputrc


# Copy app preferences
cp $DOTFILES_ROOT/macos/preferences/dot.gitconfig $HOME/.gitconfig
cp $DOTFILES_ROOT/macos/preferences/dot.gitignore $HOME/.gitignore
cp $DOTFILES_ROOT/macos/preferences/dot.vimrc $HOME/.vimrc
cp $DOTFILES_ROOT/macos/preferences/dot.hyper.js $HOME/.hyper.js
cp $DOTFILES_ROOT/macos/preferences/com.apple.Terminal.plist $HOME/Library/Preferences/


# Copy Xcode preferences
mkdir -p $HOME/Library/Developer/Xcode/UserData/FontAndColorThemes
cp -R $DOTFILES_ROOT/macos/xcode/* $HOME/Library/Developer/Xcode/UserData/FontAndColorThemes/

# Copy scripts into the PATH folder
message "Copying..." "$DOTFILES_ROOT/macos/scripts/* /opt/bin/"
cp -R $DOTFILES_ROOT/macos/scripts/* /opt/bin/

# Check if the "tokens.sh" file exists, and if not, create a stub
# If
message "Creating ~/tokens.sh" "Modify this file to add your GitHub and SSH tokens"
# TODO: need to validate the file doesn't exist so don't overwrite it
# TODO: need to update .zshrc to source this file at the end
# TODO: remove the install-github-token function once this is working


# ==============================================================================
message "Restart terminal" "After restart, you can run the following commands:"
bullet "git config --global user.name \"Your Name\""
bullet "git config --global user.email \"youremail@yourdomain.com\""
bullet "install-brew  <-- this will install Homebrew when you're ready"
bullet "install-ruby  <-- this will instruct you to install latest Ruby"

echo

exit 0


