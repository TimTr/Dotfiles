#!/usr/bin/env zsh
#
# Modify this file at your root folder to customize this install
#
# This is the place to put references to SSH keys, GitHub tokens,
# and other personal information that doesn't belong in the ~/dotfiles
# settings due to security concerns.
#

source $HOME/.aliases
source $HOME/.functions

message "Customize environemnt" "Adding tokens, keys, and passwords..."
bullet "Enable toolchains (installed in /Some/Folder/On/Disk)"
export SWIFT_TOOLCHAIN=1

bullet "Select toolchain ID: XXXXXXX"
# Do something here

status "Enable the Snippets feature in the custom toolchain"
bullet "To try snippets, type: \"swift package learn\" within a package"
export SWIFTPM_ENABLE_SNIPPETS=1

status "Add GitHub personal access token for use with Homebrew and others"
bullet "Obviously, this must be edited ONLY in the local machine,"
bullet "Do NOT put in a GitHub repo, e.g. the dotfiles repo"
export HOMEBREW_GITHUB_API_TOKEN=EMPTY

