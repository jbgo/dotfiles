if [[ -s ~/dotfiles/local/ ]]; then
  echo "Dotfiles already installed!"
else
  mkdir -p ~/dotfiles/local/
  touch ~/dotfiles/local/bashrc

  cd ~/dotfiles/config/

  for f in *; do
    if [[ -f $f ]]; then
      if [[ -f ~/.$f ]]; then mv ~/.$f ~/.$f.bak; fi
      ln -s ~/dotfiles/config/$f ~/.$f
    fi
  done

  cd ~
  source ~/.bashrc
fi
