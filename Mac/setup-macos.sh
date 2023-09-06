#!/bin/zsh
#
# setup-macos.sh - the macOS version
source "$DOTFILES_ROOT/Mac/functions.sh"
echo
message "setup-macos.sh -- setting up for macOS via ${DOTFILES_ROOT}"


# If Xcode isn't installed, the abort the install
if xcode-select -p &> /dev/null
then
  message "Xcode selected" $(xcode-select -p)
else
  # URL docs: https://developer.apple.com/library/archive/qa/qa1633/_index.html
  error "Xcode missing" "Install Xcode first: https://appstore.com/mac/apple/xcode"
  exit 0
fi

echo
# ==============================================================================
alert "SUDO Password Required to set permissions and ownership"
read -s -k $'?Press any key to continue. Hit Control-C to abort now.\n'
echo

sudo chown -R $USER ${DOTFILES_ROOT}/*  2> /dev/null
sudo chmod -R 777 ${DOTFILES_ROOT}/*    2> /dev/null

# Un-set the quarantine bit for all my own script files
xattr -d com.apple.quarantine ${DOTFILES_ROOT}/* 2> /dev/null

echo
# ==============================================================================
message "mkdir -p" "/opt/homebrew/bin, /usr/local/bin, and $HOME/bin"
# Note that /opt/homebrew is used on Apple silicon, /usr/local is legacy Intel
# Note the /opt/bin is used in Linux setups

# Create these directories "just in case"
sudo mkdir -p $HOME/Developer/Bin
sudo mkdir -p /opt/homebrew/bin
sudo mkdir -p /usr/local/bin

# Reset ownership, note the directory name does not end in / or /*
sudo chown -R "$USER":admin $HOME/Developer/Bin
sudo chown -R "$USER":admin /opt/homebrew
sudo chown -R "$USER":admin /usr/local/bin

# Set the permissions for the folders (read/write for all)
sudo chmod 766 $HOME/Developer/Bin
sudo chmod 777 /opt/homebrew/bin
sudo chmod 777 /usr/local/bin

# Put some files in these directories just to validate
cp ${DOTFILES_ROOT}/readme.md $HOME/Developer/Bin
cp ${DOTFILES_ROOT}/readme.md /opt/homebrew/bin
cp ${DOTFILES_ROOT}/readme.md /usr/local/bin

# ==============================================================================
message "Copying dotfiles" "Overwriting existing versions of these files"
cp $DOTFILES_ROOT/Mac/zshrc.sh $HOME/.zshrc
cp $DOTFILES_ROOT/Mac/zshenv.sh $HOME/.zshenv
cp $DOTFILES_ROOT/Mac/aliases.sh $HOME/.aliases
cp $DOTFILES_ROOT/Mac/functions.sh $HOME/.functions
# cp $DOTFILES_ROOT/Mac/zprofile.sh $HOME/.zprofile

# Copy app preferences
cp $DOTFILES_ROOT/Mac/Preferences/* $HOME/Library/Preferences/

# Copy config files
cp $DOTFILES_ROOT/Mac/Preferences/dot.gitconfig $HOME/.gitconfig
cp $DOTFILES_ROOT/Mac/Preferences/dot.gitignore $HOME/.gitignore
cp $DOTFILES_ROOT/Mac/Preferences/dot.vimrc $HOME/.vimrc


# Copy Xcode preferences
mkdir -p $HOME/Library/Developer/Xcode/UserData/FontAndColorThemes
cp -R $DOTFILES_ROOT/Mac/Xcode/* $HOME/Library/Developer/Xcode/UserData/FontAndColorThemes/


# Register gitignore and other git stuff
git config --global core.excludesfile ~/.gitignore


# ==============================================================================
message "Copying scripts" "Scripts are now in PATH: $HOME/Developer/Bin"
cp -R $DOTFILES_ROOT/Mac/Scripts/* $HOME/Developer/Bin/


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
# Check if the "~/local.sh" file exists, and if not, copy over the stub
if [[ -f "$HOME/local.sh" ]]; then
  message "~/local.sh exists" "Delete the file then re-run to install a template version"
else
  message "Creating ~/local.sh" "Modify this file to add GitHub and SSH tokens"
  cp $DOTFILES_ROOT/Mac/local.sh $HOME/local.sh
fi


# ==============================================================================
# Example Xcode defaults:  https://github.com/ctreffs/xcode-defaults
message "Settings defaults" "Xcode, Terminal, and other app preferences"

# Tells Xcode to never re-open last open project, regardless of OS setting
defaults write com.apple.dt.Xcode ApplePersistenceIgnoreState -bool YES

# Sets Xcode to show extensions for a few additional file types
# The single-quote, comma + space format, no space at end is important!
defaults write com.apple.dt.Xcode IDEFileExtensionDisplayShowOnlyList '(c, cc, cpp, h, hpp, m, mm, gif, icns, jpeg, jpg, png, tiff, sh, md, html, css, js)'

# Stops the IDE from saving the workspace layout (window size, etc)
# defaults write com.apple.dt.Xcode IDEDisableStateRestoration -bool YES

# Save screenshots to the downloads folder
defaults write com.apple.screencapture location -string “$HOME/Downloads”

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string “png”


# ==============================================================================
message "Restart terminal" "After restart, you can run the following commands:"
bullet "git config --global user.name \"Your Name\""
bullet "git config --global user.email \"youremail@yourdomain.com\""
bullet "install-brew.sh  <-- this will install Homebrew when you're ready"
bullet "install-ruby.sh  <-- this will install a recent Ruby via rbenv"
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
