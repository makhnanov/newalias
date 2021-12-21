export NEWALIAS_DIR=$(dirname -- "${BASH_SOURCE[0]}")

. $NEWALIAS_DIR/newalias-function.sh

alias hosts='sudo nano /etc/hosts'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias c='clear'

alias nrest='sudo service nginx restart'
alias nconf='sudo mc /etc/nginx'
alias nerror='cat /var/log/nginx/error.log'

alias rwx="sudo chmod -R 777"

alias ports='nmap -p- '

alias t='trans -target ru+en'

alias yii='php yii'

alias matrix='cmatrix -B'

alias git-cle='git config --local -e'
