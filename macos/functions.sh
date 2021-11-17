#!/bin/zsh


# Functions to make output attractive when running the script
#
# NOTE: some characters in parameters will not work, e.g. "!"
#
message () { printf "\r  [\033[00;32m $1\033[0m ] $2\n" }
status ()  { printf "\r\033[00;35m === $1\033[0m $2\n" }
error ()   { printf "\r  [\033[00;31m $1\033[0m ] $2\n" }
bullet ()  { printf "\r    - \033[00;36m $1\033[0m \n" }


# ... Find all files recursively under current folder
commands () {
    message ".functions" "****************************************"
    echo
    more ~/.functions
    
    message ".aliases" "****************************************"
    echo
    more ~/.aliases
}


# ... Find all files recursively under current folder
findall () {
    find ./ -name $1 -print 2> /dev/null
}


# ... Create a new directory and enter it
md() {
    mkdir -p "$@" && cd "$@"
}


# ... Install the GitHub Personal Access Token
install-github-token() {
    echo "Be sure to pass the GitHib Personal Access Token as a parameter"
    echo "You entered token: $1"
    echo "export HOMEBREW_GITHUB_API_TOKEN=$1" >> ~/.zshrc
}

# Delete Xcode derived data
delete-derived-data() {
    echo "Deleting all Xcode derived data..."
    rm -rdf ~/Library/Developer/Xcode/DerivedData/*
}

# Some cool Xcode defaults:  https://github.com/ctreffs/xcode-defaults

# Tells Xcode to never re-open last open project, regardless of OS setting
defaults write com.apple.dt.Xcode ApplePersistenceIgnoreState -bool YES
defaults write com.apple.dt.Xcode IDEDisableStateRestoration -bool YES

# Sets Xcode to show extensions for .sh and .md files, additionally
# NOTE: the single-quote, comma + space format, with no space before/after the
# paranthesis must be precise
defaults write com.apple.dt.Xcode IDEFileExtensionDisplayShowOnlyList '(c, cc, cpp, h, hpp, m, mm, gif, icns, jpeg, jpg, png, tiff, sh, md)'

# Save screenshots to the downloads folder
defaults write com.apple.screencapture location -string “$HOME/Downloads”

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string “png”

# Removes the delay in hide/show the Dock setting
# defaults write com.apple.Dock autohide-delay -float 0 && killall Dock

# Display full POSIX path as Finder window title
# defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Finder: show hidden files by default
# defaults write com.apple.finder AppleShowAllFiles -bool true

# Automatically hide and show the Dock
# defaults write com.apple.dock autohide -bool true
