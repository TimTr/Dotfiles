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


message "Customizing environemnt" "Adding tokens, keys, and passwords..."

status "Enabling toolchains (installed in /Some/Folder/On/Disk)"
export SWIFT_TOOLCHAIN=1

status "Selecting toolchain ID: XXXXXXX"
# Do something here

status "Enable the Snippets feature in the custom toolchain"
export SWIFTPM_ENABLE_SNIPPETS=1

status "NOTE: to try snippets, go into a package and type:"
bullet "    `swift package learn`"

status "Adding GitHub personal access token for use with Homebrew and others"
bullet "Obviously, this must be edited ONLY in the local machine,"
bullet "Do NOT put in a GitHub repo, e.g. the dotfiles repo"
export HOMEBREW_GITHUB_API_TOKEN=EMPTY

