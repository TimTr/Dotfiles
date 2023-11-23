# Dotfiles for Tim Triemstra

Documentation for these `dotfiles` can be [found here](https://timtr.github.io/Dotfiles/Docs/).

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

Once installed, a tool called `help.sh` is runable from the PATH for additional help. 


## Features

**local.sh** - Installs a file called `~/local.sh` (if doesn't exist) that you can customize with settings that do not belong checked into GitHub, for instance set certain keys, or environment variables. This is also the file to add things like feature flags during development, add a Swift toolchain, or to enable secret build settings.

**ZSH settings** - sets up the prompt, `PATH`, and other basic settings. Note that `.zshenv` sets up the PATH so it works even when there is no interactive terminal session, and `.zshrc` will source this file for a consistent PATH for terminal windows.

Files ending in `.sh` are often renamed to have a "dot" prefix and no extension (`.sh` removed). The the `.sh` extension hints to text editors to highlight like a shell script, and also makes it clear which are "source" versions of these files, versus the installed no-extension versions.


### Other small features

- Creates a symlink from ~/Dropbox to the new ~/Library/CloudStorage directory if it exists


### Order of loading

For reference, `zsh` config files are loaded in the following order:

```
    .zshenv    -- global (even non-interactive), useful for PATH and tooling variables
    .zshrc     -- loaded from the interactive shell (e.g. a Terminal window)
    .zprofile  -- if login (not using this file in current setup)
```


## Setup a custom Swift toolchain

You can download new Swift toolchains from [Swift.org](https://swift.org/download/#snapshots) and set them up to be used by default.  The `~/local.sh` file is perfect to place to configure these settings rather than make the changes to the main Dotfile repo since it is likely to be a per-machine configuration.


## Overview

This is my personal collection of setup scripts for macOS (and soon Linux), including settings for the `zsh` shell, Terminal, Xcode, and several other tools and apps. This set will also install Ruby, along with `rbenv` as a way to control which version of Ruby should act as the system default. This is useful for tools like `jekyll`.

The scripts are designed to work in `zsh`, although they rarely use advanced features and are likely portable to other shells. SImply run `setup.sh` to install, or re-install, at any time.

The setup will create a custom folder `$HOME/bin/` that is added to the PATH variable and useful for putting random stuff in the path. For Homebrew and related tools support, it also adds `/usr/local/bin` (for Intel) and `/opt/homebrew/bin` (for Apple) to the PATH. 

There are a few aliases added that make it easy to install Homebrew and other tools, rather than trying to do the installs directly from `setup.sh`. Mostly this is because the install is a multi-step process, and it is just a lot easier to run the full setup, then manually type `setup-brew.sh` when everything else looks to be working.


## Demos

Once installed, you can install Homebrew and run demos. For example, run `demo-homebrew.sh` from the PATH to show a Terminal screen of software being downloaded, built, installed, and erased (in a repeating loop). Hit `CONTROL-Z` to quit that demo.

You can also open the `~/Developer/demo-safari-cycle.html` file to launch Safari and begin cycling through many web pages, implying a sort of automated web test harness. 


## License

These scripts and settings are provided for free, covered by the MIT license.


## Useful reference links

This project's' [documentation for Dotfiles FIXME](https://dotfiles.github.io)

Which `zsh` files contain which settings: [CodeSpaces and Dotfiles](https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout)

Docs on using `setup.sh` with [GitHub CodeSpaces and Dotfiles](https://docs.github.com/en/codespaces/customizing-your-codespace/personalizing-codespaces-for-your-account)


