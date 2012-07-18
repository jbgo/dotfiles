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
  mvim `bundle show $1`
}
alias og=open_gem

# clear out pesky vim swap files
alias rm.swp='echo "removing vim .swp files"; rm ~/.vim/backup/*.swp'
