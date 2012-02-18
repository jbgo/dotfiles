alias rr="touch tmp/restart.txt; echo 'restarted rails'" # restart a rails app
alias log='tail -f log/development.log' # show the development log for a rails app
alias what?='tail -n 250 log/development.log'
alias dbmigrate='bx rake db:migrate; bx rake db:test:load'
alias dbredo='bx rake db:migrate:redo; bx rake db:test:load'
alias work='bx rake resque:work'

# Rails 3.x
alias sr='script/rails'

# Rails 2.3.x
alias rsc='ruby script/console'
alias rdb='ruby script/dbconsole'
alias rg='ruby script/generate'
alias rgm='ruby script/generate migration'

# filters a rails development log for page and template render times
alias rails-perf='grep -E "(Processing|Rendered|Completed)" log/development.log'

# Preview the compiled javascript for a coffeescript file
function coffeep() {
  coffee -c -p $1 | less
}
alias coff=coffeep

function start_passenger() {
  port=`cat tmp/.passenger-port`
  passenger start -p $port -d
}

function stop_passenger() {
  port=`cat tmp/.passenger-port`
  passenger stop -p $port
}

# check for bloated passenger processes
function ckpass() {
  process_group_id=`ps aux | grep "PassengerHelperAgent" | grep -o -E 'root +[0-9]+' | grep -o -E '[0-9]+'`
  ps -m -g $process_group_id -o pid,ppid,pgid,%mem,rss,command
}
