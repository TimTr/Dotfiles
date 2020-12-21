#!/bin/zsh
#
# dot-install.sh
echo
message "./dot-install.sh" "!! Be sure you ran this file within \"dotfiles\" home"

# export the source folders
export DOTFILES_ROOT=$(pwd -P)
# Source (import) in functions such as message, status, and error
source ${DOTFILES_ROOT}/template/dot-source.sh

# Create the ~/Developer folder, just in case
export DEVELOPER_HOME=$HOME/Developer
export DEVELOPER_BIN=${DEVELOPER_HOME}/Bin
mkdir -p ${DEVELOPER_HOME} 2> /dev/null
mkdir -p ${DEVELOPER_BIN} 2> /dev/null

## Report that we are in the right source folder for the dotfiles
status "Source folder is DOTFILE_ROOT:" ${DOTFILES_ROOT}
status "Destination in PATH is DEVELOPER_BIN:" ${DEVELOPER_BIN}



# ==============================================================================
# Install each of the sub-sections
${DOTFILES_ROOT}/macos-system/macos-system.sh
${DOTFILES_ROOT}/macos-settings/macos-settings.sh
${DOTFILES_ROOT}/macos-xcode/macos-xcode.sh
${DOTFILES_ROOT}/macos-homebrew/macos-homebrew.sh








#### ==========================================================================
# First this script needs to see if it is being run from the system location,
# most likely /usr/local/bin.  If it is not, then first copy all the files in
# the current folder over to /usr/local/bin.  The rest of the script will
# work against files from that destination. This will allow any user account
# on the system to re-run this script to setup that user. This is perfect for
# setting up demo machine and accounts easily.

#### Check if current file is already running from /usr/local/bin
if [ "${SETUP_FILEPATH}" != ${SETUP_BINFILE} ]; then

#### Verify the .zshrc file is available in the setup folder, it is needed
  if [ -f "${SETUP_HOME}/.zshrc" ]; then

    echo -e " Copying setup files to folder in global PATH: ${SETUP_BINPATH}"

    # chown and chmod all the files before we copy them
    sudo chown -R $USER ${SETUP_HOME}/* 2> /dev/null
    sudo chmod -R 777 ${SETUP_HOME}/* 2> /dev/null

    # Un-set the quarantine bit for all my own script files
    xattr -d com.apple.quarantine ${SETUP_HOME}/* 2> /dev/null

    # first make sure /usr/local/bin exists and is free to write in
    sudo mkdir ${SETUP_BINPATH} 2> /dev/null
    sudo chmod -R 777 ${SETUP_BINPATH} 2> /dev/null
  
    # then copy all the files and subfolders to the global PATH folder
    # NOTE: the format is important to be copying the folder and dot, not a wildcard /*
    #       because trying to use a wildcard will skip the files starting with dot
    cp -R ${SETUP_HOME}/. ${SETUP_BINPATH}
  
  else
  
    echo
    echo -e " $C_GLOW2 File ${SETUP_HOME}/.zshrc not found. $C_END"
    echo -e "   - Cannot find .zshrc in the current folder. Aborting."
    echo -e "   - Run this script from within the dotfiles folder, or from the PATH"
    echo -e "   - with files copied into ${SETUP_BINPATH} already."
    exit
    
  fi

else

  echo -e "\n Running file ${SETUP_FILEPATH} is already in the PATH. Skipped the copy."

fi

echo -e " Installing a few app preferences (eg: Terminal, Xcode)"
cp ${SETUP_BINPATH}/Settings/com.apple.Terminal.plist ~/Library/Preferences/

#### Copy all the Xcode colors and themes -- requires re-launch
#       NOTE: Do not copy the Xcode .plist as that breaks account settings (GitHub etc.)
mkdir -p ${HOME}/Library/Developer/Xcode/UserData/FontAndColorThemes 2> /dev/null

cp ${SETUP_BINPATH}/Settings/Xcode/*.xccolortheme ${HOME}/Library/Developer/Xcode/UserData/FontAndColorThemes/


echo -e " Installing config profile files for zsh and git"
rm ~/.profile       2> /dev/null
rm ~/.bash_profile  2> /dev/null
rm ~/.bashrc        2> /dev/null

cp ${SETUP_BINPATH}/.zshrc ${HOME}/.zshrc
cp ${SETUP_BINPATH}/.zprofile ${HOME}/.zprofile
cp ${SETUP_BINPATH}/.aliases ${HOME}/.aliases
cp ${SETUP_BINPATH}/.functions ${HOME}/.functions
cp ${SETUP_BINPATH}/.gitignore ${HOME}/.gitignore
cp ${SETUP_BINPATH}/.gitconfig ${HOME}/.gitconfig


#### Will need to have copied the ~/.aliases file over already.
#### These are also sourced as part of the .zshrc file most likely
source $HOME/.aliases
source $HOME/.functions

status "./dot-test.sh - done." "Restart Terminal for changes to take effect"
exit 0




# From Zach Holman's original script that walks the directory tree
# and runs the install.sh script in each subfolder
#
# find . -name install.sh | while read installer ; do sh -c "${installer}" ; done


## ==========================================================================
# comment "Make sure the ~/Public folder is truly public" \

# If the ~/Public folder doesn't exist, create it
# if [ ! -d "${HOME}/Public" ]; then
#
#  sudo mkdir -p ${HOME}/Public
#  comment "Created ${HOME}/Public"
#
# else
#
#  comment "Folder ${HOME}/Public already configured."
#
# fi
#
# sets permissions for everything inside the Public folder
# sudo chmod -vvR ugo=rwX $${HOME}/Public
#
# repressed the output since it gets really noisy if there are files already there.
# sudo chmod -R +ai "staff allow list,add_file,search,add_subdirectory,delete_child,readattr,writeattr,readextattr,writeextattr,readsecurity,file_inherit,directory_inherit" ${HOME}/Public 2> /dev/null
#
# Create a new simple script that will re-apply the rules if things get borked
# echo "sudo chmod -R og+wrX ." > ${HOME}/Public/update-permissions.sh
# chmod 777 ${HOME}/Public/update-permissions.sh
#
########### END COMMENTED OUT BLOCK
