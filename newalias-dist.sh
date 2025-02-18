export NEWALIAS_DIR=$(dirname -- "${BASH_SOURCE[0]}")

. $NEWALIAS_DIR/newalias-function.sh

alias hosts='sudo nano /etc/hosts 2>/dev/null || nano /etc/hosts'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias c=clear

alias nrest='sudo service nginx restart 2>/dev/null || service nginx restart'
alias nconf='sudo mc /etc/nginx 2>/dev/null || mc /etc/nginx'
alias nt='sudo nginx -t 2>/dev/null || nginx -t'
alias nerror='cat /var/log/nginx/error.log'

alias rwx="sudo chmod -R 777 2>/dev/null || chmod -R 777"

alias ports='nmap -p- '

alias t='trans -target ru+en'

alias yii='php yii'

alias matrix='cmatrix -B'

alias git-config-local='git config --local -e'
alias git-exclude-local='nano .git/info/exclude'
alias nginx-conf='mc /etc/nginx'
alias nginx-status='service nginx status'
alias nginx-reload='service nginx reload'
alias nginx-stop='service nginx stop'
alias nginx-start='service nginx start'
alias nginx-restart='service nginx restart'
alias nginx-error='mc /var/log/nginx'

alias d=docker
alias dc='docker compose'
alias docker-stop-all='docker stop $(docker ps -aq)'
alias docker-rm-all-containers='docker rm $(docker ps -aq)'
alias docker-rm-all-volumes='docker volume rm $(docker volume ls -q)'
alias docker-rm-all-images='docker rmi $(docker images -q)'

alias hooks='xfce4-terminal -e "mc .git/hooks/"'
alias rm-vendor='sudo rm -rf vendor/ 2>/dev/null || rm -rf vendor/'

alias suspend='systemctl suspend'
alias shell='while true; do clear && make shell; sleep 1; done;'

mkcd() {
  mkdir -p "$1" && cd "$1"
}
