#!/bin/zsh
#
# dotfiles.sh - the Linux version

# TODO: abort if git, cc, or other needed tools are not available
source "$DOTFILES_ROOT/Linux/dot-functions.sh"
message "dotfiles.sh -- clean setup up for macOS via ${DOTFILES_ROOT}"



chown -R $USER ${DOTFILES_ROOT}/*  2> /dev/null
chmod -R 777 ${DOTFILES_ROOT}/*    2> /dev/null

# Un-set the quarantine bit for all my own script files
xattr -d com.apple.quarantine ${DOTFILES_ROOT}/* 2> /dev/null

# ==============================================================================
message "mkdir -p" "/opt/homebrew/bin, /usr/local/bin, and $DOTFILES_BIN"
# Note that /opt/homebrew is used on Apple silicon, /usr/local is legacy Intel
# Note the /opt/bin is used in Linux setups

# Create these directories "just in case"
sudo mkdir -p $DOTFILES_BIN
sudo mkdir -p /opt/homebrew/bin
sudo mkdir -p /usr/local/bin

# Reset ownership, note the directory name does not end in / or /*
sudo chown -R "$USER":admin $DOTFILES_BIN
sudo chown -R "$USER":admin /opt/homebrew
sudo chown -R "$USER":admin /usr/local/bin

# Set the permissions for the folders (read/write for all)
sudo chmod 766 $DOTFILES_BIN
sudo chmod 777 /opt/homebrew/bin
sudo chmod 777 /usr/local/bin


# ==============================================================================
message "Copying scripts into $DOTFILES_BIN" "These scripts are now in PATH"
# Put some files in these directories just to validate
cp ${DOTFILES_ROOT}/readme.md $DOTFILES_BIN

# Don't copy with -R for the primary PATH files
cp -R $DOTFILES_ROOT/Mac/* $DOTFILES_BIN


# ==============================================================================
message "Installing root dotfiles" "Overwriting existing versions of these files"
cp $DOTFILES_ROOT/Mac/Home/dot-zshrc.sh $HOME/.zshrc
cp $DOTFILES_ROOT/Mac/Home/dot-zshenv.sh $HOME/.zshenv
cp $DOTFILES_ROOT/Mac/Home/dot-aliases.sh $HOME/.aliases
cp $DOTFILES_ROOT/Mac/Home/dot-functions.sh $HOME/.functions

# Copy Git and other config files
cp $DOTFILES_ROOT/Mac/Home/dot-gitconfig $HOME/.gitconfig
cp $DOTFILES_ROOT/Mac/Home/dot-gitignore $HOME/.gitignore
cp $DOTFILES_ROOT/Mac/Home/dot-vimrc $HOME/.vimrc

# Register gitignore and other git stuff
git config --global core.excludesfile ~/.gitignore

message "Installing app preferences" "Overwriting Terminal, Xcode, and other settings"
# Copy app settings
cp $DOTFILES_ROOT/Mac/Preferences/* $HOME/Library/Preferences/

# Copy Xcode preferences
mkdir -p $HOME/Library/Developer/Xcode/UserData/FontAndColorThemes
cp -R $DOTFILES_ROOT/Mac/Xcode/* $HOME/Library/Developer/Xcode/UserData/FontAndColorThemes/





# ==============================================================================
# Check if the "~/Dropbox" directory (or symlink) exists, and verify that
# there is indeed a $HOME/Library/CloudStorage/Dropbox folder to link to
if [[ -d "$HOME/Dropbox/" ]]; then
  message "~/Dropbox exists" "If symlink is incorrect, manually delete and rerun"
else
  if [[ -d "$HOME/Library/CloudStorage/Dropbox/" ]]; then
    message "Creating ~/Dropbox" "Symlink to ~/Library/CloudStorage/Dropbox/"
    ln -s $HOME/Library/CloudStorage/Dropbox $HOME/Dropbox
  else
    message "Dropbox skipped" "Not installed at ~/Library/CloudStorage/Dropbox/"
  fi
fi


# ==============================================================================
# Check if the "~/local.sh" file exists, and if not, copy  the stub version to user home
if [[ -f "$HOME/local.sh" ]]; then
  message "~/local.sh exists" "Delete the file then re-run to install a template version"
else
  message "Creating ~/local.sh" "Modify this file to add GitHub and SSH tokens"
  cp $DOTFILES_ROOT/Mac/Home/local-template.sh $HOME/local.sh
fi


# ==============================================================================
# Example Xcode defaults:  https://github.com/ctreffs/xcode-defaults
message "Settings defaults" "Xcode, Terminal, and other app preferences"

# Tells Xcode to never re-open last open project, regardless of OS setting
defaults write com.apple.dt.Xcode ApplePersistenceIgnoreState -bool YES

# Sets Xcode to show extensions for a few additional file types
# The single-quote, comma + space format, no space at end is important!
defaults write com.apple.dt.Xcode IDEFileExtensionDisplayShowOnlyList '(c, cc, cpp, h, hpp, m, mm, gif, icns, jpeg, jpg, png, tiff, sh, md, html, css, js)'

# Set macOS to not write .DS_Store files on network drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

# Set macOS to not write .DS_Store files on USB drives
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool TRUE

# Save screenshots to the downloads folder
# defaults write com.apple.screencapture location -string “$HOME/Downloads”

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
# defaults write com.apple.screencapture type -string “png”

# Stops Xcode IDE from saving the workspace layout (window size, etc)
# defaults write com.apple.dt.Xcode IDEDisableStateRestoration -bool YES



message "Restart terminal" "After restart, you can run the following commands:"
bullet "git config --global user.name \"Your Name\""
bullet "git config --global user.email \"youremail@yourdomain.com\""
bullet "setup-brew.sh  <-- install or update Homebrew"
bullet "setup-ruby.sh  <-- setup a newer version (or update) of Ruby via Homebrew"
echo

exit 0









# ==============================================================================
# Other ideas for defaults settings

# Removes the delay in hide/show the Dock setting
# defaults write com.apple.Dock autohide-delay -float 0 && killall Dock

# Display full POSIX path as Finder window title
# defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Finder: show hidden files by default
# defaults write com.apple.finder AppleShowAllFiles -bool true

# Automatically hide and show the Dock
# defaults write com.apple.dock autohide -bool true
