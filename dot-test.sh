#!/bin/zsh
#
# dot-test.sh

# NOTE: Ensure that any variables that downstream scripts
#       need are exported before calling the script.

# If need to grab parent folder, do this:   cd "$(dirname "$0")/.."
export DOTFILES_ROOT=$(pwd -P)
export DEVELOPER_HOME=$HOME/Developer

source ${DOTFILES_ROOT}/template/dot-source.sh

message "NOTE:" "Now running dot-test.sh. Be sure you ran this file from within"
message "NOTE:" "the DotFiles home folder or much of it will not work.\n"

## cd "$(dirname "$0")/.."



## Try out the printing function above
message "DOTFILE_ROOT" ${DOTFILES_ROOT}

# Install the template (just an example)
${DOTFILES_ROOT}/template/install.sh


# =========================================================================
# macOS





echo ''
message "Finished" All components are installed
echo ''


