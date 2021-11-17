#!/usr/bin/env zsh
#
# Modify this file at your root folder to customize this install
#
# This is the place to put references to SSH keys, GitHub tokens,
# and other personal information that doesn't belong in the ~/dotfiles
# settings due to security concerns.
#

message "Customizing environemnt" "Adding tokens, keys, and passwords..."
bullet "Adding GitHub personal access token"




bullet "Enabling toolchains (installed in /Some/Folder/On/Disk)"
export SWIFT_TOOLCHAIN=1

bullet "Selecting toolchain ID: XXXXXXX"
# Do something here

bullet "Enable the Snippets feature in the custom toolchain"
export SWIFTPM_ENABLE_SNIPPETS=1

bullet "NOTE: to try snippets, go into a package and type:"
bullet "    `swift package learn`"


