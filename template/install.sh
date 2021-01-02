#!/bin/zsh
#
# install.sh - template version (rename to platform-tool.sh)

# Import the default functions used in these scripts
source ${DOTFILES_ROOT}/macos-shell/functions.sh
status "install-tool.sh - start" "Configuring app and tool settings"

# $(dirname $0) gives the name of the enclosing folder for the current file
#  - Can't use PWD, that shows the Terminal session's home, not the file's home
status "$(dirname $0)" "Current folder launching this install.sh file"
source $(dirname $0)/update.sh

# ==============================================================================
status "install-tool.sh - (template) done" "Returning to parent script"
exit 0


