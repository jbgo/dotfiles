mkdir -p ~/dotfiles/local/
touch ~/dotfiles/local/bashrc

cd ~/dotfiles/config/

for f in *; do
  if [ -f $f ]; then
    if [ -h ~/.$f ]; then
      echo "symlink already eixsts for ~/.$f"
    elif [ -f ~/.$f ]; then
      from=~/.$f
      to=~/.$f.bak
      echo "backing up existing file: $from -> $to"
      mv $from $to
    else
      from=~/dotfiles/config/$f
      to=~/.$f
      echo "creating symlink $from -> $to"
      ln -s $from $to
    fi
  fi
done

cd ~
source ~/.bashrc
