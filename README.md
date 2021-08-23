# dotfiles for Tim Triemstra

To install, run the following command:

```
    git clone https://github.com/timtr/dotfiles.git
    cd dotfiles
    ./setup.sh
```

The `dotfiles` folder needs to exist at the home root to work properly.


### TODO: Items

- Moved to `setup.sh` per convention GitHub is promoting (see links at bottom)
- Setup is only designed to work from a home folder `~/dotfiles` on any OS
- Add variable named `DOTFILES_INSTALLED` that is set to `1` if already installed


## Overview

This is my personal collection of setup scripts for macOS (and soon Linux), including settings for the `zsh` shell, Terminal, Xcode, and several other tools and apps. This set will also install Ruby, along with `rbenv` as a way to control which version of Ruby should act as the system default. This is useful for tools like `jekyll`.

The scripts are designed to work in `zsh`, although they rarely use advanced features and are likely portable to other shells. The `dot.sh` tool controls everything. To install, you need to follow these steps:

- First clone the repo from GitHub and put it in `~/dotfiles`
- Go into the `~/dotfiles` folder within Terminal (do not run from elsewhere)
- Type `./dot.sh install` to run the initial setup
- Quit Terminal and restart it
- Type `dot.sh` or `dot.sh update` to finish the installation
- You can re-run `dot.sh` at any time to update or reset the configuration

The file  `dot.sh` is installed in the PATH, and is just a symlink to the `dot-update.sh` above. Be sure to run `dot` after running a fresh `dot-install.sh` as tools like Jekyll and others require that the environment, such as `rbenv` is fully setup before it can be run, forcing the two-step process.

Note the these files drive other installer scripts within the subfolders, for instance to install Xcode settings, or configure the default ZSH shell. So the interesting work is really in thees folders.

Installing will create a folder in the user home folder called `~/Developer/Bin` that is added to the PATH variable. Other folders may be added to `~/Developer` but only the `Bin` folder should be in the PATH when complete. Notably, some sub-installers (for instance from Homebrew) may further autment the path, but those are specific to third-party tools.

Other example dotfiles setups use advanced logic to traverse all sub-folders, launching an `install.sh` file, or some other strict pattern. I considered that route, but since there will never be hundreds of folders, I'm manually calling each sub-installer, and each has its own name, so it is easier to read when the tabs are open in the text editor, or to see reported errors.



## Install

Install by cloning from GitHub into `~/.dotfiles` like this:

```sh
    mkdir ~/.dotfiles
    git clone https://github.com/timtr/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    ./dot.sh
```


`dot.sh` is a simple script that installs some dependencies, sets sane macOS
defaults, and so on. Tweak this script, and occasionally run `dot.sh` from
time to time to keep your environment fresh and up-to-date. 


## License

These scripts and settings are provided for free, covered by the MIT license found within the repository.

### Inspired by...

An early inspiration for this repo was Zach Holman's [post on dotfiles](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/). But as this repo is composed mostly of a mish-mash of StackOverflow search results, I wouldn't want to blame him or anyone else for the poor script code you'll find here.


## Useful reference links

- https://docs.github.com/en/codespaces/setting-up-your-codespace/
- https://dotfiles.github.io

Docs that `setup.sh` is a starter script used by GitHub Codespaces: [CodeSpaces and Dotfiles](https://docs.github.com/en/codespaces/customizing-your-codespace/personalizing-codespaces-for-your-account)


