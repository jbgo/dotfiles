alias ls='ls -lhF'
alias tf='tail -f'
alias tn='tail -n'
alias grepr='grep -d recurse -n' # recursive grep with line numbers
alias grepo='grep -R -h -o -E' # recursive grep with only matching text printed
alias lsenv='printenv | ack -i' # search for strings in environment variables
alias password='head /dev/random | md5' # generate a random password
alias readme='test -x `which redcarpet` && test -f ./README.md && redcarpet README.md > ~/.Trash/readme.html && open ~/.Trash/readme.html'

# git
alias g='git'
alias sg='sudo git'
alias cleanwd='rm $(g ls-files -o)' # remove untracked files from working dir
alias grmd='g rm $(g ls-files -d)' # stage all deleted files

# ssh
alias ssh-hosts='grep -E "^Host [a-zA-Z]" ~/.ssh/config'

# mac os x
alias vf='open -a Finder .' # view current directory in Finder

# ruby
alias bx='bundle exec'
alias guard='bx guard -c'
alias sp='bx rspec'
alias cuke='bx cucumber'

# apache
alias rs='sudo apachectl restart'
alias vhosts='sudo vi /etc/apache2/extra/httpd-vhosts.conf'
