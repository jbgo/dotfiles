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

# git
alias g='git'
alias sg='sudo git'
alias gs='g s' # I typically don't want to run ghostscript, I want to run git status
alias cleanwd='rm $(g ls-files -o)' # remove untracked files from working dir
alias grmd='g rm $(g ls-files -d)' # stage all deleted files

# ssh
alias ssh-hosts='grep -E "^Host [a-zA-Z]" ~/.ssh/config'

# mac os x
alias vf='open -a Finder .' # view current directory in Finder

# ruby
alias bx='bundle exec'
alias guard='bx guard -c'
alias sp='bx rspec --color'
alias cuke='bx cucumber'

# nginx
alias rs='echo "Stopping nginx..."; pgrep nginx; for pid in $(pgrep nginx); do sudo kill $pid; done; echo "Starging nginx..."; sudo launchctl start org.nginx; sleep 1; pgrep nginx'
alias vhosts='sudo vi /opt/nginx/conf/nginx.conf'
