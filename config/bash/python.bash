# and those pesky .pyc files
alias rm.pyc='find ./ -type f -name "*.pyc" -exec rm {} \;'

# running python tests
alias nose='rm.pyc; nosetests'
