# .zshenv - Loaded in every session, even if not interactive. Great for PATH.

# Homebrew and local binaries folder for my scripts in the PATH
export PATH="$HOME/Bin:/opt/homebrew/bin"

# Put Homebrew-installed Ruby at the start of the PATH (override macOS version)

# If the Intel version of Ruby is installed, pre-pend it and Gems to the PATH
if [ -d "/usr/local/opt/ruby/bin" ]; then
  export PATH=$PATH:/usr/local/opt/ruby/bin
  export PATH=$PATH:`gem environment gemdir`/bin
fi

# If the Apple silicon version of Ruby is installed, pre-pend it and Gems to the PATH
if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH=$PATH:/opt/homebrew/opt/ruby/bin
  export PATH=$PATH:`gem environment gemdir`/bin
fi

# Add default system PATHs at end of the chain
export PATH="$PATH:/usr/bin:/usr/local/bin:/usr/local/sbin:/bin:/usr/sbin:/sbin"

# This is a version with Cryptexes - think we can skip re-adding them
# export PATH="$PATH:/usr/bin:/usr/local/bin:/usr/local/sbin:/bin:/usr/sbin:/sbin:/System/Cryptexes/App/usr/bin"


# Python3 - Augument the default PATH for Python3 use
export PY_PYTHON=3


