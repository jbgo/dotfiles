#!/bin/bash

set -e

mkdir -p ~/dotfiles/local/
touch ~/dotfiles/local/bashrc

cd ~/dotfiles/config/

function create_symlink() {
  from=$1
  to=$2
}

for f in *; do
  if [ -h ~/.$f ]; then
    echo "symlink already eixsts for ~/.$f"
  elif [ -f ~/.$f ]; then
    from=~/.$f
    to=~/.$f.bak
    echo "backing up existing file: $from -> $to"
    mv $from $to
  fi

  if [ ! -h ~/.$f ]; then
    from=~/dotfiles/config/$f
    to=~/.$f
    if [ ! -d $from ]; then
      echo "creating symlink $from -> $to"
      ln -s $from $to
    fi
  fi
done

if [ `which brew` ]; then
  # for tmux os x clipboard integration
  brew install reattach-to-user-namespace
fi

cd ~
source ~/.bashrc
