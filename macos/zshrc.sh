# GLOBAL ENVIRONMENT VARIABLES
# -------------------------------------


#### Will need to have copied over the ~/.aliases and other files already.
source $HOME/.aliases
source $HOME/.functions

TIMENOW=$(date +%d-%m-%Y" "%H:%M:%S)
message ".zshrc" "Launched $SHELL' at ${TIMENOW}."


# ==============================================================================
# Hard-coding the ~/Developer/Bin folder to lead the PATH
# Add the Homebrew paths and custom path first

# TODO: remove PATH setups from this file, rely on .zshenv (but test first!)
# export PATH="/opt/homebrew/bin:/usr/local/bin:/opt/bin"
# Add default system PATHs to the chain (these are REALLY important)
# export PATH="$PATH:/usr/bin:/usr/local/sbin:/bin:/usr/sbin:/sbin"
# Add the Xcode tooling folder to PATH
# export PATH="$PATH:/Library/Apple/usr/bin"


# Warn about installing Homebrew and Ruby as needed
which -s brew &> /dev/null
if [[ $? != 0 ]] ; then
  error "Missing Homebrew"  "Run install-brew.sh"
fi

# This `rbenv` setting needs to be hard-coded into .zshrc by default
# If you get a "command not found" for rbenv, run `install-ruby`
#
# To read more about installing rbenv see: https://github.com/rbenv/rbenv
# eval "$(rbenv init - zsh)"
which -s rbenv &> /dev/null
if [[ $? != 0 ]] ; then
  error " - Missing rbenv" "Run install-ruby.sh"
else
  eval "$(rbenv init -)"
  export PATH="${HOME}/.rbenv/bin:$PATH"
# export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1) --with-gdbm-dir=/opt/local"
fi


# ==============================================================================
# Make VSCode the default editor.
export EDITOR='code';


# ==============================================================================
# Prompt and color settings

# Syntax coloring for ZSH is a bit different than bash
autoload colors; colors;
export CLICOLOR=1
export LSCOLORS=gxFxCxDxbxExBxAxaxaxex
# another example for zsh: export LSCOLORS=GxFxCxDxBxexexaxaxaxex

# ==============================================================================
# Custom prompt with newline before each new command entry
NEWLINE=$'\n'
PS1="${NEWLINE}%F{blue}[%F{white}%~%{%F{white}%}%F{blue}]%F{cyan}▶︎ %{%f%}%"


# end of file


# ==============================================================================
# Other ideas for reference

# Removes the delay in hide/show the Dock setting
# defaults write com.apple.Dock autohide-delay -float 0 && killall Dock

# Display full POSIX path as Finder window title
# defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Finder: show hidden files by default
# defaults write com.apple.finder AppleShowAllFiles -bool true

# Automatically hide and show the Dock
# defaults write com.apple.dock autohide -bool true

# Tell grep to highlight matches (throwing errors)
# export GREP_OPTIONS='—color=auto'

# export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$DOTFILES_DIR/bin"

# ==============================================================================
# Previous iterations of the prompt line
# NEWLINE=$'\n'
# PS1="${NEWLINE}%F{white} %F{cyan}%~%{%F{white}%} %F{red}▶︎%F{yellow}▶︎ %{%f%}%"
# PS1="${NEWLINE}%F{white}🐛 [%F{cyan}%~%{%F{white}%}] %{%f%}%"







