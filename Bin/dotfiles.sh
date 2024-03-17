#!/bin/zsh
#
# setup-macos.sh - the macOS version
echo
source "$DOTFILES_ROOT/Home/dot-functions.sh"

# DEBUG OUTPUT
message "DOTFILES_ROOT" "$DOTFILES_ROOT"
message "dotfiles.sh" "run location = ${0:a:h}"

# ==============================================================================
# CHECK PRE-REQUISITES OF ZSH and XCODE INSTALLS
#
# Require `zsh` as the default, and set the default shell if needed
if [ $SHELL != "/bin/zsh" ]; then
  chsh -s /bin/zsh
  echo "Requires \"zsh\". Switched default shell to /bin/zsh -- re-run setup.sh file"
  exit 0
fi

# If Xcode isn't installed, then abort the install
if xcode-select -p &> /dev/null
then
  message "Xcode selected at:" "$(xcode-select -p)"
else
  error "Xcode missing! Install Xcode, then re-run the script."
  exit 0
fi
echo


# ==============================================================================
echo "SUDO is required to ensure proper permissions and ownership"
# read -s -k $'?Press any key to continue. Hit Control-C to abort now.\n'
echo

sudo chown -R $USER ${DOTFILES_ROOT}/*  2> /dev/null
sudo chmod -R 777 ${DOTFILES_ROOT}/*    2> /dev/null

# Un-set the quarantine bit for all my own script files
xattr -d com.apple.quarantine ${DOTFILES_ROOT}/* 2> /dev/null


# ==============================================================================
message "mkdir -p" "/opt/homebrew/bin, /usr/local/bin, and $DOTFILES_DESTINATION"
# Note that /opt/homebrew is used on Apple silicon, /usr/local is legacy Intel
# Note the /opt/bin is used in Linux setups

# Create these directories "just in case"
sudo mkdir -p /opt/homebrew/bin
sudo mkdir -p /usr/local/bin

# Reset ownership, note the directory name does not end in / or /*
sudo chown -R "$USER":admin /opt/homebrew
sudo chown -R "$USER":admin /usr/local/bin

# Set the permissions for the folders (read for all, write for just me)
sudo chmod 744 /opt/homebrew/bin
sudo chmod 744 /usr/local/bin


# ==============================================================================
# TODO: No longer copying to a new Dotfiles destination. Just use this folder.
# message "Copying scripts into $DOTFILES_DESTINATION" "These scripts are now in PATH"
# cp -R $DOTFILES_ROOT/readme.md $DOTFILES_DESTINATION


# ==============================================================================
message "Installing root dotfiles" "Overwriting existing versions of these files"
cp $DOTFILES_ROOT/Home/dot-zshrc.sh $HOME/.zshrc
cp $DOTFILES_ROOT/Home/dot-zshenv.sh $HOME/.zshenv
cp $DOTFILES_ROOT/Home/dot-aliases.sh $HOME/.aliases
cp $DOTFILES_ROOT/Home/dot-functions.sh $HOME/.functions

# Copy Git and other config files
cp $DOTFILES_ROOT/Home/dot-gitconfig $HOME/.gitconfig
cp $DOTFILES_ROOT/Home/dot-gitignore $HOME/.gitignore
cp $DOTFILES_ROOT/Home/dot-vimrc $HOME/.vimrc

# Register gitignore and other git stuff
git config --global core.excludesfile ~/.gitignore

message "Installing app preferences" "Overwriting Terminal, Xcode, and other settings"
# Copy app settings
cp $DOTFILES_ROOT/Preferences/* $HOME/Library/Preferences/

# Copy Xcode preferences
mkdir -p $HOME/Library/Developer/Xcode/UserData/FontAndColorThemes
cp -R $DOTFILES_ROOT/Xcode/* $HOME/Library/Developer/Xcode/UserData/FontAndColorThemes/


# ==============================================================================
message "Adding local settings" "Adding paths and variables to .zshenv"
echo " " >> ~/.zshenv
echo "# Add global DOTFILES_ROOT pointing Dotfiles install folder" >> ~/.zshenv
echo "export DOTFILES_ROOT=$DOTFILES_ROOT" >> ~/.zshenv


# ==============================================================================
# Check if $HOME/Library/CloudStorage/Dropbox exists, and if so create symlinks
if [[ -d "$HOME/Dropbox/" ]]; then
  message "~/Dropbox exists" "If symlink is incorrect, manually delete and rerun"
else
  if [[ -d "$HOME/Library/CloudStorage/Dropbox/" ]]; then
    message "Creating ~/Dropbox" "Symlink to ~/Library/CloudStorage/Dropbox/"
    ln -s $HOME/Library/CloudStorage/Dropbox $HOME/Dropbox
    ln -s $HOME/Library/CloudStorage/Dropbox/Code $HOME/Code
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
  cp $DOTFILES_ROOT/Home/local-template.sh $HOME/local.sh
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


# ==============================================================================
message "Restart terminal" "After restart, you can run the following commands:"
bullet "git config --global user.name \"Your Name\""
bullet "git config --global user.email \"youremail@yourdomain.com\""
bullet "setup-brew.sh  <-- install or update Homebrew"
bullet "setup-ruby.sh  <-- setup a newer version (or update) of Ruby via Homebrew"
echo

exit 0









# ==============================================================================
# Other ideas for defaults settings

# Save screenshots to the downloads folder
# defaults write com.apple.screencapture location -string “$HOME/Downloads”

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
# defaults write com.apple.screencapture type -string “png”

# Stops Xcode IDE from saving the workspace layout (window size, etc)
# defaults write com.apple.dt.Xcode IDEDisableStateRestoration -bool YES

# Removes the delay in hide/show the Dock setting
# defaults write com.apple.Dock autohide-delay -float 0 && killall Dock

# Display full POSIX path as Finder window title
# defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Finder: show hidden files by default
# defaults write com.apple.finder AppleShowAllFiles -bool true

# Automatically hide and show the Dock
# defaults write com.apple.dock autohide -bool true
