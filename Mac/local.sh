#!/usr/bin/env zsh
#
# Modify this file at your root folder to customize this install
#
# This is the place to put references to SSH keys, GitHub tokens,
# and other personal information that doesn't belong in the ~/dotfiles
# settings due to security concerns.
#

if [[ -v LOADED_LOCAL ]]; then return; fi
export LOADED_LOCAL=true


source $HOME/.aliases
source $HOME/.functions

message "Loading local.sh..." "Set local Swift toolchain, keys, and passwords..."

bullet "Enabled latest Swift.org toolchain installed in /Library/Developer/Toolchains/"
bullet "NOTE: export TOOLCHAIN=null to revert to default swift tools in any shell session"
export TOOLCHAINS=swift
# Above uses toolchain at: /Library/Developer/Toolchains/swift-latest.xctoolchain
# This will always point at the newest-installed Toolchain
# Simplest answer is to delete any toolchains to go back to default
# or can export TOOLCHAINS=null to go back to default

# Alternately, pick any specific toolchain using its identifier.
# To get the identifier, first run the following command in Terminal:
#
#    /usr/libexec/PlistBuddy -c "Print CFBundleIdentifier:" /Library/Developer/Toolchains/swift-[TOOLCHAIN FILENAME]/Info.plist
#
# Then set TOOLCHAINS to equal that result, e.g. command will look like:
#
#    export TOOLCHAINS=org.swift.57202301021a
#


# Obviously, this must be edited ONLY in the local machine
# Do NOT put in a GitHub repo, e.g. the dotfiles repo
bullet "e.g.: Add GitHub personal access token for use with Homebrew and others"
export HOMEBREW_GITHUB_API_TOKEN=EMPTY


# EXAMPLE: This was used during development of the Swift-DocC snippets feature
#
# bullet "Enable Snippets: type \"swift package learn\" within a package"
# export SWIFTPM_ENABLE_SNIPPETS=1



# end of file.

