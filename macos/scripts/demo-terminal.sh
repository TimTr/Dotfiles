#!/bin/zsh
#
# demo-terminal.sh - the macOS version

# Install then uninstall wget to show off the terminal
brew install wget

# Uninstall all the packages
brew uninstall wget
brew uninstall gettext
brew uninstall libidn2
brew uninstall openssl@1.1

# Delete all caches for all the removed packages
brew cleanup -s

### Can no re-run the above commands and it will show a complete build

# ==============================================================================
message "Something" "More text"
bullet "... and some more text"

echo

exit 0


