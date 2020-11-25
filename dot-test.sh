#!/usr/bin/env bash
#
# dot-test.sh  -- tests code before putting it in the main script

## cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)
export DEVELOPER_HOME=$HOME/Developer


intro () { printf "\r  [\033[00;32m $1\033[0m ] $2\n"
}
message () { printf "\r  [\033[00;34m $1\033[0m ] $2\n"
}
error () { printf "\r  [\033[00;31m $1\033[0m ] $2\n"
}

## Try out the printing function above
intro "DOTFILE_ROOT" ${DOTFILES_ROOT}

# Install the template (just an example)
./_template/install.sh


# =========================================================================
# macOS





echo ''
message "Finished" All components are installed
echo ''


