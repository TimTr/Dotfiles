# .dotfiles

This is Tim Triemstra's personal collection of dotfiles, settings, and setup scripts for macOS. 

The scripts are  qualified to work in ZSH, although they rarely use advanced features and are likely portable to other shells. The important files are at the root, and are the only files that should be directly launched by hand.

- `dot-install.sh`  - installs a fresh version of the dotfiles, and creates new PATH folders
- `dot-update.sh`  - only updates existing installs (dot-install.sh is likely safe to re-run)
- `dot-test.sh` - when a make a change, this is the file I use to experiment

Once installed, there will be a file called `dot` installed in the PATH. You can run this to reset the configuration of the shell and standard OS settings at any time. This is the same file as `dot-update.sh` above.

Note the these files drive other installer scripts within the subfolders, for instance to install Xcode settings, or configure the default ZSH shell. So the interesting work is really in thees folders.

Installing will create a folder in the user home folder called `~/Developer/Bin` that is added to the PATH variable. Other folders may be added to `~/Developer` but only the `Bin` folder should be in the PATH when complete. Notably, some sub-installers (for instance from Homebrew) may further autment the path, but those are specific to third-party tools.

Other example dotfiles setups use advanced logic to traverse all sub-folders, launching an `install.sh` file, or some other strict pattern. I considered that route, but since there will never be hundreds of folders, I'm manually calling each sub-installer, and each has its own name, so it is easier to read when the tabs are open in the text editor, or to see reported errors.



## Install

The install the very first time by cloning from GitHub, go into a `dotfiles` folder and run:

```sh
    git clone https://github.com/timtr/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    script/bootstrap
```


`dot` is a simple script that installs some dependencies, sets sane macOS
defaults, and so on. Tweak this script, and occasionally run `dot` from
time to time to keep your environment fresh and up-to-date. You can find
this script in `bin/`.




## Inspired by Zach Holman's dotfiles

My original inspiration for workign with dotfiles, and reproducible setup scripts, was to be able to very quickly setup new Macs for demos. This was a pretty big part of my daily life at work. But I got inspired to completely rethink how I manage the process by reading Zach Holman's [post on dotfiles](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/). This project was rebuilt, starting from [Zach's repository](https://github.com/holman/dotfiles/). I confess to not doing a fork because I mostly wanted to start from scratch (so I fully understood the inner-workings) and because my version will be  simple when completed. Hopefully this acknowledgement suffices to give him the kudos he deserves for the inspiration.


**The text below is copied from Zach's original dotfiles readme:**

> I (Zach) forked [Ryan Bates](http://github.com/ryanb)' excellent [dotfiles](http://github.com/ryanb/dotfiles) for a couple years before the weight of my changes and tweaks inspired me to finally roll my own. But Ryan's dotfiles were an easy way to get into bash customization, and then to jump ship to `zsh` a bit later. A decent amount of the code in these dotfiles stem or are inspired from Ryan's original project.


## License

Everything in here is made available under the MIT license found within the repository.
