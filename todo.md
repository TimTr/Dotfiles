# TODO Items

- Verify that re-running `dotfiles.sh` from anywhere resets the setup
- Report current `git config` name/email after setup, or instruct to setup
    - Do something similar for Ruby, Homebrew, or other pieces
- Function to delete `./DS_Store` files recursively down a folder structure 


## Done

- Put Dotfiles as the source for PATH - no separate copy. This will make it easier to support putting Dotfiles at the root of a user directly by simply cloning from GitHub, which is how I expect to use Dotfiles in the future, especially on Linux.

- Move everything from the `./Mac/` subfolder to the root - Linux remains
- Add `~/Code` and `~/TimTr` to the root user folder aliased to Dropbox or iCloud
- Rename `./Bin` back to Developer
- Added new VSCode theme settings to `./Mac/Settings`
- Use `setup-brew.sh` to update/upgrade if already installed (not two files)
- Add the active git branch of the current folder to the prompt
- Install into `$HOME/Bin` instead of ~/Developer
- Move all script files into main `Mac` folder to go into the $PATH
- Put root `~/Developer` in the PATH (remove `./Bin` sub-folder)
- Rename the dot files to `dot-name.sh` to be more clear (Almost done)
- Copy all scripts and settings into `~/Developer`
- Add all `update-ruby.sh` functionality into `setup-ruby.sh` script
- Move the actual dotfiles (e.g. `zshenv`) into subfolder `Root`





