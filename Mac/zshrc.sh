# .zshrc - Loaded only in interactive shell sessions
#
# Because this file is only loaded in interactive shell (Terminal) sessions,
# It is perfect for setting up things like colors, etc. However, it isn't
# the right place to setup PATH and other variables that tools may want.
# For those global (no shell visible) cases, use the `.zshenv` file.
# -------------------------------------------------------------


source $HOME/.aliases
source $HOME/.functions

TIMENOW=$(date +%d-%m-%Y" "%H:%M:%S)
message ".zshrc" "Launched $SHELL' at ${TIMENOW}."

# No PATH setups within this file, rely on .zshenv (but test first!)


# Warn about installing Homebrew and Ruby as needed
which -s brew &> /dev/null
if [[ $? != 0 ]] ; then
  error "Missing Homebrew" "Run install-brew.sh"
fi

# This `rbenv` setting needs to be hard-coded into .zshrc by default
# If you get a "command not found" for rbenv, run `install-ruby`
#
# To read more about installing rbenv see: https://github.com/rbenv/rbenv
# eval "$(rbenv init - zsh)"
which -s rbenv &> /dev/null
if [[ $? != 0 ]] ; then
  error "Missing rbenv" "Run install-ruby.sh"
else
  eval "$(rbenv init -)"
  export PATH="${HOME}/.rbenv/bin:$PATH"
# export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1) --with-gdbm-dir=/opt/local"
fi

# ==============================================================================
# Prompt and color settings (zsh-specific, different from bash)
autoload colors; colors;
export CLICOLOR=1
export LSCOLORS=gxFxCxDxbxExBxAxaxaxex
# another example for zsh: export LSCOLORS=GxFxCxDxBxexexaxaxaxex

# ==============================================================================
# Custom prompt with newline before each new command entry
NEWLINE=$'\n'
PS1="${NEWLINE}%F{111}[%F{251}%~%{%F{blue}%F{111}]%F{46}▶︎ %{%f%}%"

# PS1="${NEWLINE}%F{39}[%F{white}%~%{%F{blue}%}%F{39}]%F{cyan}▶︎ %{%f%}%"

# Info on ZSH colors
# https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/
# 256 color cheat sheet
# https://www.ditig.com/256-colors-cheat-sheet
# Previous prompt
# PS1="${NEWLINE}%F{blue}[%F{white}%~%{%F{white}%}%F{blue}]%F{cyan}▶︎ %{%f%}%"


# end of file


# ==============================================================================
# Other ideas for reference

# Tell grep to highlight matches (throwing errors)
# export GREP_OPTIONS='—color=auto'

# ==============================================================================
# Previous iterations of the prompt line
# NEWLINE=$'\n'
# PS1="${NEWLINE}%F{white} %F{cyan}%~%{%F{white}%} %F{red}▶︎%F{yellow}▶︎ %{%f%}%"
# PS1="${NEWLINE}%F{white}🐛 [%F{cyan}%~%{%F{white}%}] %{%f%}%"







