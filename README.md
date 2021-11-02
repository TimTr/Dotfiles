# dotfiles for Tim Triemstra

To install, run the following command:

```
    cd ~
    git clone https://github.com/timtr/dotfiles.git
    cd dotfiles
    ./setup.sh
```

The `dotfiles` folder is expected to be at the user's home folder root, but is also largely functional if `setup.sh` is run from any user folder. Once installed, quit Terminal and relaunch. You can now install Homebrew by typing:

```
    git config --global user.name "Your Name"
    git config --global user.email "youremail@yourdomain.com"
    
    install-brew
    install-ruby  // TODO: this isn't working yet
```

At any time, you can see a list of new commands by typing `commands`


You may want to quit and restart Terminal after this install as well.


### Setup a custom Swift toolchain

You can download new Swift toolchains from [Swift.org](https://swift.org/download/#snapshots) and set them up to be used by default. There is a new alias installed by these dotfiles called `swift-alt` that will run the `swift` command line interface using the alternate toolchain, once installed.

This dotfiles install will install a file called `.swift-settings.sh` at the user's root, enabling feature flags and adding the `swift-alt` alias. You will likely need to edit this file to enter the bundle ID of the installed toolchain you would like to use. As a result, the dotfiles `setup.sh` script will not overwrite this file once installed, so as to not blow away your customizations. If you want to re-install this file, simply delete it and re-run the dotfiles `setup.sh` to install a fresh version.

To get the correct toolchain bundle ID, in the format `org.swift.cXXXXXXX` you will need to go to the folder `/Library/Something/Toolchains` after installed, show package contents of one of the toolchains, and open the `Info.plist` file. From there, you should see a Bundle ID entry, matching the format.



## Overview

This is my personal collection of setup scripts for macOS (and soon Linux), including settings for the `zsh` shell, Terminal, Xcode, and several other tools and apps. This set will also install Ruby, along with `rbenv` as a way to control which version of Ruby should act as the system default. This is useful for tools like `jekyll`.

The scripts are designed to work in `zsh`, although they rarely use advanced features and are likely portable to other shells. SImply run `setup.sh` to install, or re-install, at any time.

The setup will create a custom folder `/opt/bin/` that is added to the PATH variable and useful for putting random stuff in the path. It also adds `/usr/local/bin` and `/opt/homebrew/bin` to the PATH to support Homebrew and some other tools. 

There are a few aliases added that make it easy to install Homebrew and other tools, rather than trying to do the installs directly from `setup.sh`. Mostly this is because the install is a multi-step process, and it is just a lot easier to run the full setup, then manually type `install-brew` when everything else looks to be working.


## Demos

Once installed, you can install Homebrew and run demos. To do that, these commands are available:

```
    demo-brew
    demo-safari
```

The `demo-brew` command will install and uninstall many Homebrew formulas over and over, making the terminal window look very busy. Be sure to dedicate a Terminal window or tab to just this task, and use CONTROL-Z to quit whenever.

The `demo-safari` command will open Safari and begin cycling through many web pages, implying a sort of automated web test harness. Again, will need to CONTROL-Z to quit the Terminal session.




## TODO: Items

- Need to add a function, alias, or script to help install Ruby + rbenv



## License

These scripts and settings are provided for free, covered by the MIT license found within the repository.



## Useful reference links

- https://docs.github.com/en/codespaces/setting-up-your-codespace/
- https://dotfiles.github.io

Docs indicating that `setup.sh` is a starter script used by GitHub Codespaces: [CodeSpaces and Dotfiles](https://docs.github.com/en/codespaces/customizing-your-codespace/personalizing-codespaces-for-your-account)


