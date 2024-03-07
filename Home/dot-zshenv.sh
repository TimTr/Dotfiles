# .zshenv - Loaded in every session, even if not interactive. Great for PATH.

# Homebrew and local binaries folder for my scripts in the PATH
export PATH="$HOME/Developer/Bin:/opt/homebrew/bin"

# Put Homebrew-installed Ruby at the start of the PATH (override macOS version)

# Setting for Apple silicon version of Ruby. Pre-pend it and Gems to the PATH
export PATH=$PATH:/opt/homebrew/opt/ruby/bin
export PATH=$PATH:`gem environment gemdir`/bin

# Add default system PATHs at end of the chain
export PATH="$PATH:/usr/bin:/usr/local/bin:/usr/local/sbin:/bin:/usr/sbin:/sbin"

# Python3 - Augument the default PATH for Python3 use
export PY_PYTHON=3


