# TODO Items

- Use an indirect variable to set where the files are located (`./Dotfiles`)
- Move everything from the `./Mac/` subfolder to the root - Linux remains
- Drive EVERYTHING from that destination, not from the Git origin
- Make sure `./Developer/Bin` is the actual driver for `dotfiles.sh`
- Add "update" command to re-setup, but not wipe critical files
- Use "update" behavior by default if `setup.sh` is run via PATH
- Report current `git config` name/email after setup, or instruct to setup
    - Do something similar for Ruby, Homebrew, or other pieces
- Function to delete `./DS_Store` files recursively down a folder structure 



## Done

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





