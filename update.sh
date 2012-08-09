cd ~/dotfiles/config/

for f in *; do
  if [[ -f $f ]]; then
    if [[ -f ~/.$f ]]; then
      echo "File exits: ~/.$f"
    else
      echo "Adding ~/.$f"
      ln -s ~/dotfiles/config/$f ~/.$f
    fi
  fi
done

cd ~
source ~/.bashrc
