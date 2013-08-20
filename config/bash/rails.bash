alias rr="mkdir -p tmp; touch tmp/restart.txt; echo 'restarted rails'" # restart a rails app
alias log='tail -f log/development.log' # show the development log for a rails app
alias loga="tail -f log/development.log | grep -vE '(Served asset|Started GET ./assets|^$|RailsDevTweaks)'"
alias what?='tail -n 250 log/development.log'
alias dbmigrate='bx rake db:migrate; bx rake db:test:load'
alias dbredo='bx rake db:migrate:redo; bx rake db:test:load'
alias work='bx rake resque:work'

if [ -d ./script ]; then
  # Rails 3
  rails_script_dir=script
else
  # Rails 4
  rails_script_dir=bin
fi

alias sr="$rails_script_dir/rails"

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

function bgrep() {
  grep -R --color "$@" `bundle show --paths`
}
