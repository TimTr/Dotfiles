# Dotfiles for Tim Triemstra

Documentation for these `dotfiles` can be [found here](https://timtr.github.io/Dotfiles/).

To read more documentation [in the "about" document here](./Docs/index.html).

On a Mac, first install Xcode or the command line tools package. Then run:

```
    git clone https://github.com/timtr/Dotfiles.git
    cd Dotfiles
    ./setup.sh
```

Run `setup.sh` from within a local `Dotfiles` folder instance. Once installed, quit Terminal and relaunch. Finish install by typing:

```
    git config --global user.name "Your Name"
    git config --global user.email "youremail@yourdomain.com"
    
    install-brew.sh
    install-ruby.sh
```

A tool called `help.sh` is runable from the shell for additional help. 


## Features

Files ending in .sh are often renamed to be prefix by a `"."` with the `.sh` extension removed. This makes these files easier to edit during creation of this project, and also makes it clear which are "source" versions of these files, versus the installed versions.

**ZSH settings** - sets up the prompt, `PATH`, and other basic settings. Note that `.zshenv` sets up the PATH so it works even when there is no interactive terminal session, and `.zshrc` will source this file for a consistent PATH for terminal windows.

**local.sh** - Installs a file called `~/local.sh` (if doesn't exist) that you can customize with settings that do not belong checked into GitHub, for instance set certain keys, or environment variables. This is also the file to add things like feature flags during development, add a Swift toolchain, or to enable secret build settings.

### Other smaller features

- Creates a symlink from ~/Dropbox to the new ~/Library/CloudStorage directory if it exists


### Order of loading

For reference, `zsh` config files are loaded in the following order:

```
    .zshenv    -- global (even if not interactive) so good for PATH etc
    .zshrc     -- if interactive shell
    .zprofile  -- if login (not using this file in current setup)
```


### Known Issues and ToDo items

- TODO: report the current `git config --global user.name "your name"` info, or if not set then report how to set it. Same for the setting for `git config --global user.email \"email@domain.com\"`
- TODO: `install-brew.sh` is not configured at all, just is a copy of ruby installer 




## Setup a custom Swift toolchain

You can download new Swift toolchains from [Swift.org](https://swift.org/download/#snapshots) and set them up to be used by default. There is a new alias installed by these dotfiles called `swift-alt` that will run the `swift` command line interface using the alternate toolchain, once installed.

This dotfiles install will install a file called `.swift-settings.sh` at the user's root, enabling feature flags and adding the `swift-alt` alias. You will likely need to edit this file to enter the bundle ID of the installed toolchain you would like to use. As a result, the dotfiles `setup.sh` script will not overwrite this file once installed, so as to not blow away your customizations. If you want to re-install this file, simply delete it and re-run the dotfiles `setup.sh` to install a fresh version.

To get the correct toolchain bundle ID, in the format `org.swift.cXXXXXXX` you will need to go to the folder `/Library/Something/Toolchains` after installed, show package contents of one of the toolchains, and open the `Info.plist` file. From there, you should see a Bundle ID entry, matching the format.



## Overview

This is my personal collection of setup scripts for macOS (and soon Linux), including settings for the `zsh` shell, Terminal, Xcode, and several other tools and apps. This set will also install Ruby, along with `rbenv` as a way to control which version of Ruby should act as the system default. This is useful for tools like `jekyll`.

The scripts are designed to work in `zsh`, although they rarely use advanced features and are likely portable to other shells. SImply run `setup.sh` to install, or re-install, at any time.

The setup will create a custom folder `$HOME/bin/` that is added to the PATH variable and useful for putting random stuff in the path. For Homebrew and related tools support, it also adds `/usr/local/bin` (for Intel) and `/opt/homebrew/bin` (for Apple) to the PATH. 

There are a few aliases added that make it easy to install Homebrew and other tools, rather than trying to do the installs directly from `setup.sh`. Mostly this is because the install is a multi-step process, and it is just a lot easier to run the full setup, then manually type `install-brew` when everything else looks to be working.


## Demos

Once installed, you can install Homebrew and run demos. To do that, these commands are available:

```
    demo-brew
    demo-safari
```

The `demo-brew` command will install and uninstall many Homebrew formulas over and over, making the terminal window look very busy. Be sure to dedicate a Terminal window or tab to just this task, and use CONTROL-Z to quit whenever.

The `demo-safari` command will open Safari and begin cycling through many web pages, implying a sort of automated web test harness. Again, will need to CONTROL-Z to quit the Terminal session.





## License

These scripts and settings are provided for free, covered by the MIT license found within the repository.



## Useful reference links

- https://dotfiles.github.io

Which `zsh` files contain which settings: https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout


Docs indicating that `setup.sh` is a starter script used by GitHub Codespaces: [CodeSpaces and Dotfiles](https://docs.github.com/en/codespaces/customizing-your-codespace/personalizing-codespaces-for-your-account)


