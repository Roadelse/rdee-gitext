#!/bin/bash

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "The script can only be sourced rather than executed"
    exit 0
fi

if [[ -n "$1" && "$1" == "unload" ]]; then
    qG
    unset -f __git_prompt iG qG
    unset __PS1_orig
    return
fi


# PS1_orig="$PS1"

_git_prompt() {
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        return
    fi


    head_file=$(git rev-parse --git-dir)/HEAD
    if [[ -f "$head_file" ]]; then
        branch=$(cut "$head_file" -d/  -f3)
    fi

    if [[ "$1" == nostat ]]; then
        echo -e "(\033[33m${branch}\033[0m) "
        return
    fi

    if git diff-index --quiet HEAD -- 2>/dev/null; then
        echo -e "(\001\033[38;5;83m\002${branch}\001\033[0m\002) "  # green for clean; use \001 rather than '\['!
    else
        echo -e "(\001\033[38;5;203m\002${branch}\001\033[0m\002) " # red for changes
    fi
}


function iG(){
    PS1_orig="$PS1"
    export PS1="${PS1_orig}"'$(_git_prompt '$1')'
}

function iGn(){
    PS1_orig="$PS1"
    export PS1="${PS1_orig}"'$(_git_prompt nostat)'
}

function qG(){
    export PS1="${PS1_orig}"
}

