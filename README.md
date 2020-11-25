# TimTr .dotfiles

This is the personal collection of Tim Triemstra's configuration files and scripts (dotfiles) for running macOS (and Linux, in early testing). This script puts some scripts into `/usr/local/bin` as a way to put things into the PATH.

The `_template` folder shows how to add a new tool or language to the mix. Rather than automatically querry the folders as Zach's original setup did (quite nicely) this setup requires adding `./toolname/install.sh` to the list of commands in the `dot-setup.sh` file manually.

Files like `.functions` and `.aliases` will be automatically sourced when the script completes.


## Components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded
  last and is expected to setup autocomplete.
- **topic/install.sh**: Any file named `install.sh` is executed when you run `script/install`. To avoid being loaded automatically, its extension is `.sh`, not `.zsh`.
- **topic/\*.symlink**: Any file ending in `*.symlink` gets symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.

## install

The initial installer will check if it is being run from within `/usr/local/bin/dotfiles` and if not, it will setup that folder, make sure it is in the path, and copy everything from here into that shared folder. This makes it easier for any other user on the machine to setup the `dotfiles` quickly, too.

The intall the very first time, go into the `dotfiles` folder and run:

```sh
    git clone https://github.com/holman/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    script/bootstrap
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

`dot` is a simple script that installs some dependencies, sets sane macOS
defaults, and so on. Tweak this script, and occasionally run `dot` from
time to time to keep your environment fresh and up-to-date. You can find
this script in `bin/`.




## Inspired by Zach Holman's dotfiles

My original inspiration for workign with dotfiles, and reproducible setup scripts, was to be able to very quickly setup new Macs for demos. This was a pretty big part of my daily life at work. But I got inspired to completely rethink how I manage the process by reading Zach Holman's [post on dotfiles](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/). This project was rebuilt, starting from [Zach's repository](https://github.com/holman/dotfiles/). I confess to not doing a fork because I fully expect my version will be extremely anemic when completed, and probably pretty useless to tie back to the original for anyone else. Hopefully this acknowledgement suffices to give him the kudos he deserves for the inspiration.


**The text below is copied from Zach's original dotfiles readme:**

> I (Zach) forked [Ryan Bates](http://github.com/ryanb)' excellent [dotfiles](http://github.com/ryanb/dotfiles) for a couple years before the weight of my changes and tweaks inspired me to finally roll my own. But Ryan's dotfiles were an easy way to get into bash customization, and then to jump ship to zsh a bit later. A decent amount of the code in these dotfiles stem or are inspired from Ryan's original project.


## License

Everything in here is made available under the MIT license, as was Zach's original version. I don't think any of Zach's original code is in here (really, just the approach), so for simplicity I just edited the included license grant.

