# Dotfiles for Tim Triemstra

On a Mac, first install Xcode or the command line tools, then run:

```
    git clone https://github.com/timtr/Dotfiles.git
    cd Dotfiles
    ./setup.sh
```

You can also type `./setup.sh reset` to override custom files like `./local.sh` and to blow-away settings for tools like Xcode that you may otherwise not want to modify.

The first install requires that you run `setup.sh` from within the local `Dotfiles` folder. Once installed, quit Terminal and relaunch. Finish install by typing:

```
    git config --global user.name "Your Name"
    git config --global user.email "youremail@yourdomain.com"
    
    setup-brew.sh
    setup-ruby.sh
```

Once installed, run `help.sh` for additional help. 

## Overview

This is my personal collection of setup scripts for macOS (and soon Linux), including settings for the `zsh` shell, Terminal, Xcode, and several other tools and apps. This set will also install Ruby, along with `rbenv` as a way to control which version of Ruby should act as the system default. This is useful for tools like `jekyll`.

The scripts are designed to work in `zsh`, although they rarely use advanced features and are likely portable to other shells. SImply run `setup.sh` to install, or re-install, at any time.

The setup will create a custom folder `$HOME/bin/` that is added to the PATH variable and useful for putting random stuff in the path. For Homebrew and related tools support, it also adds `/usr/local/bin` (for Intel) and `/opt/homebrew/bin` (for Apple) to the PATH. 

There are a few aliases added that make it easy to install Homebrew and other tools, rather than trying to do the installs directly from `setup.sh`. Mostly this is because the install is a multi-step process, and it is just a lot easier to run the full setup, then manually type `setup-brew.sh` when everything else looks to be working.


## Features

**local.sh** - Installs a file called `~/local.sh` (if doesn't exist) that you can customize with settings that do not belong checked into GitHub, for instance set certain keys, or environment variables. This is also the file to add things like feature flags during development, add a Swift toolchain, or to enable secret build settings.

**reset** - use this parameter from `setup.sh` to overwrite all settings, even `~/local.sh`

**ZSH settings** - sets up the prompt, `PATH`, and other basic settings. Note that `.zshenv` sets up the PATH so it works even when there is no interactive terminal session, and `.zshrc` will source this file for a consistent PATH for terminal windows.

The added `~/Dropbox` symlink points to `~/Library/CloudStorage/Dropbox` if it exists


## Using a custom Swift toolchain

You can download new Swift toolchains from [Swift.org](https://swift.org/download/#snapshots) and set them to be used by default.  The `~/local.sh` file is perfect to place to configure these settings per-machine, rather than configure in the main Dotfiles repo. 


## Demos

Once installed, you can install Homebrew and run demos. For example, run `demo-homebrew.sh` from the PATH to show a Terminal screen of software being downloaded, built, installed, and erased (in a repeating loop). Hit `CONTROL-Z` to quit that demo.

You can also open the `~/Developer/demo-safari-cycle.html` file to launch Safari and begin cycling through many web pages, implying a sort of automated web test harness. 


## Useful reference links

Documentation (or the start of docs) can be [found here](https://timtr.github.io/Dotfiles/Docs/).

Which `zsh` files contain which settings: [CodeSpaces and Dotfiles](https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout)

Docs on using `setup.sh` with [GitHub CodeSpaces and Dotfiles](https://docs.github.com/en/codespaces/customizing-your-codespace/personalizing-codespaces-for-your-account)

### Order of loading

For reference, `zsh` config files are loaded in the following order:

```
    .zshenv    -- global (even non-interactive), useful for PATH and tooling variables
    .zshrc     -- loaded from the interactive shell (e.g. a Terminal window)
    .zprofile  -- if login (not using this file in current setup)
```

