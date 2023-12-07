# TODO Items

- Add "refresh" command to re-setup, but not wipe critical files
- If `setup.sh` is run from the PATH, don't override app settings
- Report current `git config --global user.name "your name"` info after setup
    - If it is empty, output instructions to set it up
    - Do something similar for Ruby, Homebrew, or other pieces
- Turn `setup-brew.sh` into an auto upgrade/upgrade if already setup.
    - Eliminate the need for a two-step process
- Function to delete `./DS_Store` files recursively down a folder structure 

## Done

- Add the current git branch of the current folder to the prompt
- Install into `$HOME/Bin` instead of ~/Developer
- Move all script files into main `Mac` folder to go into the $PATH
- Put root `~/Developer` in the PATH (remove `./Bin` sub-folder)
- Rename the dot files to `dot-name.sh` to be more clear (Almost done)
- Copy all scripts and settings into `~/Developer`
- Add all `update-ruby.sh` functionality into `setup-ruby.sh` script
- Move the actual dotfiles (e.g. `zshenv`) into subfolder `Root`





