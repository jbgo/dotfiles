# Expands NERDTree when calling mvim from a directory with no args
alias __mvim=`which mvim`
function mvim() {
  if (( $# > 0 )); then
    __mvim $*
  else
    __mvim . # expands NERDTree automatically
  fi
}

# clear out pesky vim swap files
alias rm.swp='echo "removing vim .swp files"; rm ~/.vim/backup/*.swp'
