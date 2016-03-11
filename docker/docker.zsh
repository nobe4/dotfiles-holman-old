eval "$(docker-machine env default)"

alias dk="docker"
alias dc="docker-compose"
alias dkip="docker-machine ip default | /usr/bin/tr -d '\n' | tee >(pbcopy) | xargs echo copied$1"
