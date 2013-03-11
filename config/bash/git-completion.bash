git_completion_path="/usr/local/Cellar/git/$(git --version | awk '{print $3}')/etc/bash_completion.d"
source "$git_completion_path/git-completion.bash"
source "$git_completion_path/git-prompt.sh"

__git_complete g __git_main
