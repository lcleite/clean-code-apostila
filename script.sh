#!/bin/bash

command=$1
command_arg=$2

URL_GITHUB="https://github.com/lcleite/clean-code-apostila.git"
URL_GITBOOK="https://git.gitbook.com/clean-code-apostila.git"

function chrepo() {
    if [ "$command_arg" = "github" ]; then
        git remote set-url origin $URL_GITHUB
	echo "Usando repositório remoto do GitHub"
    elif [ "$command_arg" = "gitbook" ]; then
	git remote set-url origin $URL_GITBOOK
        echo "Usando repositório remoto do GitBook"
    fi
}

case "$command" in
    "chrepo" )       
        chrepo
        ;;
esac


