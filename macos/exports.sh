#!/usr/bin/env zsh

# TODO: haven't yet actually done the work to make this file good!!!

# ==============================================================================
# Python3 - Augument the default PATH for Python3 use
export PY_PYTHON=3

# Colors -- usable everywhere now that they are in the .zshrc
autoload colors; colors;

# Syntax coloring for ZSH is a bit different than bash
export CLICOLOR=1
export LSCOLORS=gxFxCxDxbxExBxAxaxaxex
# another example for zsh: export LSCOLORS=GxFxCxDxBxexexaxaxaxex


# Make VSCode the default editor.
export EDITOR='code';

# Tell grep to highlight matches
export GREP_OPTIONS='—color=auto'

# export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$DOTFILES_DIR/bin"
