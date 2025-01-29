#!/bin/zsh
#
# setup-macos.sh - the macOS version
echo
source "$DOTFILES_ROOT/Mac/dot-functions.sh"

message "✳️ DOTFILES_ROOT" "$DOTFILES_ROOT"
#message "dotfiles.sh" "run location = ${0:a:h}"


# ==============================================================================
# Require `zsh` as the default, and set the default shell if needed
if [ $SHELL != "/bin/zsh" ]; then
  chsh -s /bin/zsh
  echo "❌ Set default shell to /bin/zsh and re-run setup.sh"
  exit 0
fi

# If Xcode isn't installed, then abort the install
if xcode-select -p &> /dev/null
then
  message "✳️ xcode-selected -p:" "$(xcode-select -p)"
else
  error "❌ Install Xcode, then re-run setup.sh"
  exit 0
fi


# ==============================================================================
message "🔐 SUDO may be required" "Setting file permissions and ownership"

# Claim ownership of all my dotfiles
sudo chown -R $USER $DOTFILES_ROOT     2> /dev/null

# Make all directories (-type d) 755 executable, files (-type f) as 644
find $DOTFILES_ROOT -type d -print0 | xargs -0 chmod 755
find $DOTFILES_ROOT -type f -print0 | xargs -0 chmod 644

# Make all .sh files (-type f) also executable
find $DOTFILES_ROOT -name "*.sh" -type f -print0 | xargs -0 chmod 755

# Get rid of teh quarantine bit (which occasionally gets set for some reason)
xattr -d com.apple.quarantine $DOTFILES_ROOT/* 2> /dev/null

# /opt/homebrew on M1+ CPUs, /usr/local is Mac Intel, and /opt/bin on Linux
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
# Create ~/Developer folder in which to put local developer stuff, e.g. repos
if [[ -d "$HOME/Developer/" ]]; then
  message "    ~/Developer exists" "Use this folder for personal repositories"
else
  message "✅ Created ~/Developer" "New folder for local developer work"
fi

# ==============================================================================
# Create a ~/Work folder if it doesn't exist already
#
if [[ -d "$HOME/Work/" ]]; then
  message "    ~/Work exists" "Use this folder for work repositories"
else
  mkdir ~/Work
  message "✅ Created ~/Work" "New folder for work repositories"
fi


# ==============================================================================
message "✅ Setup root dotfiles" "Overwriting existing files at $HOME"
cp $DOTFILES_ROOT/Mac/dot-zshrc.sh $HOME/.zshrc
cp $DOTFILES_ROOT/Mac/dot-zshenv.sh $HOME/.zshenv
cp $DOTFILES_ROOT/Mac/dot-aliases.sh $HOME/.aliases
cp $DOTFILES_ROOT/Mac/dot-functions.sh $HOME/.functions
echo "Empty file to silence new shell messages" >> $HOME/.hushlogin

# Copy Git and other config files
cp $DOTFILES_ROOT/Config/dot-gitconfig $HOME/.gitconfig
cp $DOTFILES_ROOT/Config/dot-gitconfig-work $HOME/Work/.gitconfig-work
cp $DOTFILES_ROOT/Config/dot-gitignore $HOME/.gitignore
cp $DOTFILES_ROOT/Config/dot-vimrc $HOME/.vimrc

# Register gitignore and other git stuff
git config --global core.excludesfile ~/.gitignore

message "✅ Setup app preferences" "Overwriting Terminal, Xcode, and other settings"
# Copy app settings
cp $DOTFILES_ROOT/Config/Preferences/* $HOME/Library/Preferences/

# Copy Xcode preferences
mkdir -p $HOME/Library/Developer/Xcode/UserData/FontAndColorThemes
cp -R $DOTFILES_ROOT/Config/Xcode/* $HOME/Library/Developer/Xcode/UserData/FontAndColorThemes/


# ==============================================================================
message "✅ Setup defaults" "Adding paths and variables to .zshenv"
echo " " >> ~/.zshenv
echo "# Add global DOTFILES_ROOT pointing Dotfiles install folder" >> ~/.zshenv
echo "export DOTFILES_ROOT=$DOTFILES_ROOT" >> ~/.zshenv

# Example Xcode defaults:  https://github.com/ctreffs/xcode-defaults
# Xcode always opens with the "Welcome to Xcode" window, not last project
defaults write com.apple.dt.Xcode ApplePersistenceIgnoreState -bool YES

# Sets Xcode to show extensions for a few additional file types
# FORMAT IS IMPORTANT! Use single-quote, comma + space , no space at end.
defaults write com.apple.dt.Xcode IDEFileExtensionDisplayShowOnlyList '(c, cc, cpp, h, hpp, m, mm, gif, icns, jpeg, jpg, png, tiff, sh, md, html, css, js)'

# Set macOS to not write .DS_Store files on network drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

# Set macOS to not write .DS_Store files on USB drives
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool TRUE

# ==============================================================================
# Create a symlink to Dropbox's location in CloudStore if valid
#
if [[ -d "$HOME/Dropbox/" ]]; then
  message "    ~/Dropbox alias exists" "If symlink is broken, delete and rerun"
else
  if [[ -d "$HOME/Library/CloudStorage/Dropbox/" ]]; then
    message "✅ Setup ~/Dropbox" "Symlink to ~/Library/CloudStorage/Dropbox/"
    ln -s $HOME/Library/CloudStorage/Dropbox $HOME/Dropbox
  else
    alert "Dropbox not installed" "Missing folder: ~/Library/CloudStorage/Dropbox/"
  fi
fi

# ==============================================================================
# Check if the "~/local.sh" file exists, and if not, copy  the stub version to user home
if [[ -f "$HOME/local.sh" ]]; then
  message "✳️ File /local.sh already exists" "Delete the file to re-install a template"
else
  message "✅ Installing ~/local.sh" "Creating new from ./Dotfiles/Mac/local-template.sh"
  cp $DOTFILES_ROOT/Mac/local-template.sh $HOME/local.sh
fi

# ==============================================================================
message "✅ git config --global user.name =" "$(git config --get user.name)"
message "✅ git config --global user.email =" "$(git config --get user.email)"
echo
message "🎉 Success!" "Restart Terminal and run ${txtbold}setup-brew.sh${txtnormal} and ${txtbold}setup-ruby.sh${txtnormal}"

echo
exit 0








# ==============================================================================
# NOTE: disabled the Dropbox alias setup
#
# Check if $HOME/Library/CloudStorage/Dropbox exists, and if so create symlinks
#if [[ -d "$HOME/Dropbox/" ]]; then
#  message "Setup ~/Dropbox (existed)" "If symlink is broken, manually delete and rerun"
#else
#  if [[ -d "$HOME/Library/CloudStorage/Dropbox/" ]]; then
#    message "Setup ~/Dropbox and ~/Code" "Symlink to ~/Library/CloudStorage/Dropbox/"
#    ln -s $HOME/Library/CloudStorage/Dropbox $HOME/Dropbox
#    ln -s $HOME/Library/CloudStorage/Dropbox/Code $HOME/Code
#  else
#    message "Dropbox not installed" "Directory not found: ~/Library/CloudStorage/Dropbox/"
#  fi
#fi



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
