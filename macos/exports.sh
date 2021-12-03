#!/usr/bin/env zsh

# Exports environment variables, but also sets `defaults` for the system
# TODO: haven't yet actually done the work to make this file good!!!

# ==============================================================================
# Python3 - Augument the default PATH for Python3 use
export PY_PYTHON=3

# Colors -- usable everywhere now that they are in the .zshrc
autoload colors; colors;

# Syntax coloring for ZSH is a bit different than bash
export CLICOLOR=1
export LSCOLORS=gxFxCxDxbxExBxAxaxaxex
# another example for zsh: export LSCOLORS=GxFxCxDxBxexexaxaxaxex


# Make VSCode the default editor.
export EDITOR='code';

# Some cool Xcode defaults:  https://github.com/ctreffs/xcode-defaults

# Tells Xcode to never re-open last open project, regardless of OS setting
defaults write com.apple.dt.Xcode ApplePersistenceIgnoreState -bool YES

# This one stops the IDE from saving the workspace layout
# Probably don't want this one enabled
# defaults write com.apple.dt.Xcode IDEDisableStateRestoration -bool YES
defaults delete com.apple.dt.Xcode IDEDisableStateRestoration

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



# Tell grep to highlight matches (throwing errors)
# export GREP_OPTIONS='—color=auto'

# export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$DOTFILES_DIR/bin"
