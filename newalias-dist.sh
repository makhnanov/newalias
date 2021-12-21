# Fast entrance to server
# alias serv='sshpass -p VerySecretPassword ssh root@ip.v4.address.dist'

export NEWALIAS_DIR=$(dirname -- "${BASH_SOURCE[0]}")

. $NEWALIAS_DIR/newalias.conf

newalias() {
    case "$1" in
        -h|--help )
            cat << EOF
Usage: newalias [parameter]

Configuration:

Directory: $NEWALIAS_DIR
Dist aliases:  $NEWALIAS_DIR/newalias-dist.sh
Private aliases:  $NEWALIAS_DIR/newalias-private.sh
Editor: $NEWALIAS_EDITOR
Browser: $NEWALIAS_BROWSER
Configuration file: $NEWALIAS_DIR/newalias.conf

Parameters:

help - This message with parameters description.

private-edit - Edit your private file with aliases.



EOF
        ;;
        -p|--private-edit )
            echo ''
        ;;
        -d|--dist-edit )
            echo ''
        ;;
        -c|--dist-compare )
            echo ''
        ;;
        -u|--self-update )
            echo ''
        ;;
        -e|--config-edit )
            echo ''
        ;;
        * )
            echo -e "Undefined parameter $1. Use: \nnewalias help # For read more"
        ;;
    esac
}

_newalias() {
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  subcommands="-h --help -p --private-edit -d --dist-edit -c --dist-compare -u --self-update -e --config-edit"
  if [[ ${COMP_CWORD} == 1 ]] ; then
    COMPREPLY=( $(compgen -W "${subcommands}" -- ${cur}) )
    return 0
  fi
}

complete -F _newalias newalias

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
