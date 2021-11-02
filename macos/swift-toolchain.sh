#!/usr/bin/env zsh

message "Installing Toolchains" "Instruction to install a Swift toolchain:"
bullet "Update the settings in this file with the bundle ID of a toolchain"
bullet "Toolchains are installed in /Some/Folder/On/Disk"

status "Alert" "Re-installing dotfiles will override the toolchain settings"

# Enable using the toolchain instead of regular Swift
export SWIFT_TOOLCHAIN=1

# Enable the Snippets feature in nightly builds
export SWIFTPM_ENABLE_SNIPPETS=1


# ==============================================================================




# Type the following to try the "learn" experience for snippets
# swift package learn


