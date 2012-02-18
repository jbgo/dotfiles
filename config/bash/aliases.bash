alias ls='ls -lhF'
alias grepr='grep -d recurse -n' # recursive grep with line numbers
alias grepo='grep -R -h -o -E' # recursive grep with only matching text printed
alias lsenv='printenv | ack -i' # search for strings in environment variables

# git
alias g='git'
alias sg='sudo git'

# mac os x
alias vf='open -a Finder .' # view current directory in Finder

# ruby
alias bx='bundle exec'
alias guard='bx guard -c'
alias sp='bx rspec'

# apache
alias rs='sudo apachectl restart'
alias vhosts='sudo vi /etc/apache2/extra/httpd-vhosts.conf'
