#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \w]\n\$ '

export PATH="${PATH}:$HOME/bin"
export HISTCONTROL=ignoreboth
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTIGNORE="ls:l:cd:yy:yu:lg:dg:v"
#export TERM=xterm-256color
#export EDITOR=~/bin/e

man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
        man "$@"
}


datetime () { \date +%Y_%m_%d_%H_%M_%S; }

matrix() {
    for((i=1;i<=$1;i++))
    do
        for((j=1;j<=$2;j++))
        do
            printf '%d,%d\t' $i $j
        done
        printf '\n'
    done
}


vy () {
    cvlc "$1&fmt=18"
}

#http://phraktured.net/config/.bashrc
calc () { awk "BEGIN{ print $* }"; }

ytdl () {
    youtube-dl --title --no-mtime --no-overwrites \
        --restrict-filenames --continue --format 18 "$1" ; }

# filter
#f () {
#target=(*$1*)
#if [[ 1 = ${#target[@]} && ${target[0]} != '*'$1'*' ]]; then
##echo ${#target[@]}
##echo '*'$1'*'
##echo "good"
#echo ${target[0]}
#fi
#}

f () {
    shopt -s nullglob nocaseglob
    target=(*$1*)
    if [[ 1 == ${#target[@]} ]]; then
        #echo ${#target[@]}
        #echo '*'$1'*'
        #echo "good"
        echo ${target[0]}
    fi
    shopt -u nullglob nocaseglob
}

ff () { find . -maxdepth 1 -iname "*$1*" -print; }

mf () {
    mf_target="$(f $1)"
    if [[ "$mf_target" ]]; then
        mplayer "$mf_target"
    else
        find . -maxdepth 1 -iname "*$1*"
    fi
}

ding () {
  play -qn synth 2 pluck C
}

show () { local env_var="${1^^}"; echo "${!env_var}"; }

mkcd () { mkdir -p "$@" && cd "$@" ; }
