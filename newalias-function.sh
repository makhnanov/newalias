. $NEWALIAS_DIR/newalias.conf

sb='\033[1m'
eb='\033[0m'

newalias() {
    case "$1" in
        -h|--help )
            echo -e \
"${sb}Usage:${eb}
  newalias [parameter]

${sb}Configuration:${eb}
  Directory: $NEWALIAS_DIR
  Dist aliases:  $NEWALIAS_DIR/newalias-dist.sh
  Private aliases:  $NEWALIAS_DIR/newalias-private.sh
  Editor: $NEWALIAS_EDITOR
  Browser: $NEWALIAS_BROWSER
  Configuration file: $NEWALIAS_DIR/newalias.conf

${sb}Parameters:${eb}
  -h, --help           This message with parameters description.

  ${sb}-p${eb}, --private-edit   Edit your private file with aliases.

  -d, --dist-edit      Edit dist public file with aliases.
                       Not recommend for edit if you are not contributor.

  -c, --dist-compare   Open browser to compare changes with version of your public aliases and github version.

  -u, --self-update    Self update (git pull) for get new public aliases.

  -e, --config-edit    Configure editor and browser for work with newalias, and github check updates.

  -v, --version        Show current version and git commit sha.

  -t, --test           Test config for check editor and browser existence.

  -r, --readme         Show readme for get more useful tips.
"
        ;;
        -p|--private-edit )
            sudo $NEWALIAS_EDITOR $NEWALIAS_DIR/newalias-private.sh && . /etc/bash.bashrc
        ;;
        -d|--dist-edit )
            sudo $NEWALIAS_EDITOR $NEWALIAS_DIR/newalias-dist.sh && . /etc/bash.bashrc
        ;;
        -c|--dist-compare )
            LATEST_DIST=$(curl -s "https://api.github.com/repos/makhnanov/newalias/commits/main" | jq '."sha"' | xargs)
            LINK=https://github.com/makhnanov/newalias/compare/$(git -C $NEWALIAS_DIR log -1 --format="%H")..$LATEST_DIST
            if [[ -f "$NEWALIAS_BROWSER" ]]; then
                $NEWALIAS_BROWSER $LINK
            else
                echo $LINK
            fi
        ;;
        -u|--self-update )
            git -C $NEWALIAS_DIR pull && . /etc/bash.bashrc
        ;;
        -e|--config-edit )
            $NEWALIAS_EDITOR $NEWALIAS_DIR/newalias.conf && . /etc/bash.bashrc
        ;;
        -v|--version )
            echo Version: $(cat $NEWALIAS_DIR/version.txt)
            echo Branch: $(git -C $NEWALIAS_DIR rev-parse --abbrev-ref HEAD)
            echo Commit SHA: $(git -C $NEWALIAS_DIR log -1 --format="%H")
        ;;
        -t|--test )
            if [[ -f "$NEWALIAS_BROWSER" ]]; then
                echo -e "${sb}NEWALIAS_BROWSER:${eb} $NEWALIAS_BROWSER ${sb}OK${eb}"
            else
                echo -e "${sb}Problem with NEWALIAS_BROWSER.${eb} $NEWALIAS_BROWSER does not exist."
            fi
            if [[ -f "$NEWALIAS_EDITOR" ]]; then
                echo -e "${sb}NEWALIAS_EDITOR:${eb} $NEWALIAS_EDITOR ${sb}OK${eb}"
            else
                echo -e "${sb}Problem with NEWALIAS_EDITOR.${eb} $NEWALIAS_EDITOR does not exist."
            fi
            echo -e "Configuration file: \n$NEWALIAS_DIR/newalias.conf"
        ;;
        -r|--readme )
            echo -e "$(cat $NEWALIAS_DIR/Readme.md | sed 's|^#.*|\\033[1m&\\033[0m|g')"
        ;;
        * )
            echo "Unexpected parameter $1"
            echo 'newalias -h # For get help and read more.'
        ;;
    esac
}

_newalias() {
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  subcommands="-h --help -p --private-edit -d --dist-edit -c --dist-compare -u --self-update -e --config-edit -v --version -t --test -r --readme"
  if [[ ${COMP_CWORD} == 1 ]] ; then
    COMPREPLY=( $(compgen -W "${subcommands}" -- ${cur}) )
    return 0
  fi
}

complete -F _newalias newalias
