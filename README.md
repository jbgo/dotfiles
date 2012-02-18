# My dotfiles

Repository of shared config for programs I use everyday.

## Installation

```sh
git clone /jbgo/dotfiles.git ~/dotfiles
source ~/dotfiles/install.sh
```

## Public customizations

1. Make your changes in the `dotfiles/` directory
2. Run `rebash` (alias of `source ~/.bashrc`)  so your changes will take affect
3. Test your changes to make sure they work
4. TODO: Cron will commit and push your changes to github

## Private (local) customizations

Currently local/private changes are only supported for your bashrc. You
can make these `~/dotfiles/local/bashrc`. This directory is ignored by
git, so your passwords or proprietary information won't end up on github!

## Automatic syncing

TODO: create a cron job that commits local changes and pulls/pushes
changes from/to github.
