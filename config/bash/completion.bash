git_completion_path="/usr/local/Cellar/git/$(git --version | awk '{print $3}')/etc/bash_completion.d"
source "$git_completion_path/git-completion.bash"
source "$git_completion_path/git-prompt.sh"
__git_complete g __git_main

_completion_list() {
  cur="${COMP_WORDS[COMP_CWORD]}"
  COMPREPLY=( $(compgen -W "$*" -- ${cur}) $(compgen -f $cur) $(compgen -f $cur/) )
}

_complete_grb() {
  if [ -d .git ]; then
    if [[ $COMP_LINE == 'grb track*' ]]; then
      branches=`git branch -a | grep 'remotes/' | cut  -f '3' -d '/'`
      _completion_list $branches
    else
      branches=`git branch | cut -c 3-`
      tags=`git tag`
      _completion_list $branches $tags
    fi
  fi
}

alias grbt='grb track'
complete -F _complete_grb grbt
complete -F _complete_grb grb

_complete_ssh_hosts() {
  if [ -f ~/.ssh/config ]; then
    ssh_hosts=`grep -E '^Host ' ~/.ssh/config | awk '{print $2}'`
    _completion_list $ssh_hosts
  fi
}

complete -F _complete_ssh_hosts ssh
complete -F _complete_ssh_hosts scp
