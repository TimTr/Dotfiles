# TODO: Note that this setup is not actively using .zprofile

# ==========================================================================
# The .zshrc file is generated by the setup script with a dynamic $PATH
# This .zprofile file is registered before .zshrc, so sourcing .zshrc first


#### Will need to have copied over the ~/.aliases and other files already.
# source $HOME/.aliases
# source $HOME/.functions

# Welcome to the shell message
# TIMENOW=$(date +%d-%m-%Y" "%H:%M:%S)
# message ".zprofile" "Launched $SHELL' at ${TIMENOW}."


# Doesn't seem like there is a need to source this file?
# if [ -f ~/.zshrc ]; then
#     echo ".zprofile:  Sourcing the .zshrc file..."
#     source ~/.zshrc
# fi

# ==============================================================================
# Warn about installing Homebrew and Ruby as needed
# which -s brew &> /dev/null
# if [[ $? != 0 ]] ; then
#  error "Missing Homebrew"  "Run install-brew.sh"
# fi

# which -s rbenv &> /dev/null
# if [[ $? != 0 ]] ; then
#   echo " - Missing rbenv.     Run install-ruby.sh"
# fi




## ================================================================================
