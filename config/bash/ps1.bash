export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='[$(date +%k:%M:%S)] ../\W$(__git_ps1 " (%s)") \$ '
