_completion_list() {
  cur="${COMP_WORDS[COMP_CWORD]}"
  COMPREPLY=( $(compgen -W "$*" -- ${cur}) $(compgen -f $cur) $(compgen -f $cur/) )
}

_complete_grb() {
  if [ -d .git ]; then
    branches=`git branch | cut -c 3-`
    tags=`git tag`
    _completion_list $branches $tags
  fi
}

_complete_grb_remote() {
  branches=`git branch -a | grep 'remotes/' | cut  -f '3' -d '/'`
  _completion_list $branches
}

alias grbt='grb track'
complete -F _complete_grb_remote grbt
complete -F _complete_grb grb
