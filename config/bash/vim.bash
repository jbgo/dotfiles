# Expands NERDTree when calling mvim from a directory with no args
alias __mvim=`which mvim`
function mvim() {
  if (( $# > 0 )); then
    __mvim $*
  else
    __mvim . # expands NERDTree automatically
  fi
}

function open_gem() {
  gem_dir=`bundle show $1`
  if [ -d $gem_dir ]; then
    pushd $gem_dir
    __mvim .
    popd
  else
    echo "Unknown dir: $1"
  fi
}
alias og=open_gem

# clear out pesky vim swap files
alias rm.swp='echo "removing vim .swp files"; rm ~/.vim/backup/*.swp'

# quick way to install a vim plugin with pathogen from a git repo
function vimp() {
  pushd ~/.vim/bundle
  git clone $1
  popd
}
