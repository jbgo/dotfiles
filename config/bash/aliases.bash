alias ls='ls -lhF'
alias tf='tail -f'
alias tn='tail -n'
alias grepr='grep --color -d recurse -n' # recursive grep with line numbers
alias grepo='grep -R -h -o -E' # recursive grep with only matching text printed
alias lsenv='printenv | ack -i' # search for strings in environment variables
alias password='head /dev/random | md5' # generate a random password
alias readme='test -x `which redcarpet` && test -f ./README.md && redcarpet --render-fenced_code_blocks --render-no_intra_emphasis --render-autolink README.md > ~/.Trash/readme.html && open ~/.Trash/readme.html'
alias pjson='python -mjson.tool'
alias vb='VBoxManage'
alias cpkey='cat ~/.ssh/id_rsa.pub | pbcopy'
alias til='grep -d recurse -h `date "+%m/%d"` /usr/share/calendar/'
alias jbgo='cd ~/projects/opensource/jbgo'

# vim/nvim
alias vim=nvim
alias vi=nvim

# git
alias g='git'
alias sg='sudo git'
alias gs='g s' # I typically don't want to run ghostscript, I want to run git status
alias cleanwd='rm $(g ls-files -o)' # remove untracked files from working dir
alias grmd='g rm $(g ls-files -d)' # stage all deleted files

# ssh
alias ssh-hosts='grep -E "^Host [a-zA-Z]" ~/.ssh/config'
alias nginx_start='sudo launchctl load -F ~/Library/LaunchAgents/nginx.plist'
alias nginx_stop='sudo launchctl unload -F ~/Library/LaunchAgents/nginx.plist'

# mac os x
alias vf='open -a Finder .' # view current directory in Finder

# ruby
alias bx='bundle exec'
alias guard='bx guard -c'
alias sp='bx rspec --color'
alias cuke='bx cucumber'

# heroku
alias h=heroku
alias hr='heroku run'

# ansible
alias an=ansible
alias anp=ansible-playbook
alias ang=ansible-galaxy

function markdown() {
  if [ `which redcarpet` ];
  then
    redcarpet --render-fenced_code_blocks --render-no_intra_emphasis --render-autolink $1 > ~/.Trash/markdown.html && \
    open ~/.Trash/markdown.html
  else
    echo "Please install redcarpet: gem install redcarpet"
    return 1
  fi
}

function git_branch_wipeout() {
  remote=$2
  if [[ ! $remote ]]; then remote=origin; fi
  git branch -d $1 && git push $remote :refs/heads/$1
}
alias gbw=git_branch_wipeout

function wisdom() {
  cowfile=`ruby -e 'p=\`cowsay -l\`.split("\n")[0].match(/ (\/.+):/)[1];f=\`ls -1 #{p}\`.chomp.split("\n");puts f[rand(f.size)].chomp(".cow")'`
  fortune | cowsay -f $cowfile
}

function ct() {
  echo generating ctags for launguage: $1
  ctags -R --languages=$1 --exclude=.git --exclude=log --exclude=tmp
}
