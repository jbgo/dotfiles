# bash command-line completion
#source ~/.git-completion.bash

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(parse_git_dirty))/"
}

export PS1="[\$(date +%k:%M:%S)] .../\W\$(parse_git_branch) \$ "

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

complete -F _complete_grb_remote grb track
complete -F _complete_grb grb
