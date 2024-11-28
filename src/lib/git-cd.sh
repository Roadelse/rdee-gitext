
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "The script can only be sourced rather than executed"
    exit 0
fi

if [[ -n "$1" && "$1" == "unload" ]]; then
    unset -f _gitcd
    unalias gito gitcd
    return
fi


function _gitcd(){
    repo_main="$(git rev-parse --show-toplevel)"

    if [[ -n "$1" ]]; then
        cd "$repo_main/$1"
    else
        cd $repo_main
    fi
}

alias gito='_gitcd'
alias gitcd='_gitcd'