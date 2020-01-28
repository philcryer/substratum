#!/usr/bin/env bash

#####################################################################
## Substratum
#####################################################################
## Features
##  * a baseline bash script, with best practices built in
##  * add needed utilities to prefight, script will verify them
##  * add tasks/commands to _main function and make it your own
##  * liberal BSD 2-Clause License for open usage
##  * full details https://github.com/philcryer/substratum
#####################################################################


#####################################################################
## Set output preferences, magic variables (should not need to edit)
#####################################################################
set -o errexit set -o pipefail
set -o nounset
## Turn on xtrace for debug output
#set -o xtrace
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
__base="$(basename ${__file} .sh)" __root="$(cd "$(dirname "${__dir}")" && pwd)" # <-- change this as it depends on your app
arg1="${1:-}"
if [ -d "${HOME}/.local/bin/" ]; then
	PATH=$PATH:${HOME}/.local/bin
fi


#####################################################################
## Set script variables (edit as needed)
#####################################################################
pkg="substratum"
#version="0.10"
version="$(git tag)"
system=$(uname)
host=$(hostname -s)
work_dir="$__dir/work"
log_dir="$__dir/logs"
log_date=$(date +"%Y-%m-%d")
log_file="$log_date-$pkg-$version.log"
if [ ! -d $log_dir ]; then
  mkdir -p $log_dir
fi
time_start=$(date +%s)


#####################################################################
## Set output colors
#####################################################################
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
purple=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)
reset=$(tput sgr0)


#####################################################################
## Define output messages for screen and logfile
#####################################################################
_message(){
    declare msg="$1"
    _message-logger "INFO: $msg"
    shift
    pref="----"
    echo "${yellow}[ $cyan$pref$yellow ]$reset  $msg"
}

_message-header(){
    declare msg="$1"
    _message-logger "INFO: $msg"
    shift
    pref="++++"
    echo "${yellow}[ $cyan$pref$yellow ]$reset  $msg"
}

_message-error(){
    declare msg="$1"
    _message-logger "ERROR: $msg"
    echo "${yellow}[ ${red}ERRR$yellow ]$reset  $msg"
}

_message-error-exit(){
    declare msg="$1"
    declare status="$2"
    _message-error "$msg"
    exit $status
}

_message-logger(){
    echo "$(date +'%b %d %T') $host $pkg: $msg" >> "$log_dir/$log_file"
}


#####################################################################
## Base and starup functions
#####################################################################
_logo(){
    echo -n "${green}${pkg} "
    echo -n  "${red}("
    echo -n "${yellow}${version}"
    echo "${red})"
}

_basedirs(){
    if [[ -d $work_dir ]]; then
        _message "removing old $work_dir directory"
        nice -n 20 rm -rf $work_dir &
    fi
    _message "creating base directories"
    if [[ ! -d $log_dir ]]; then
        if ! mkdir -p "$log_dir"; then
            echo "$pkg: failed to make run directory: $log_dir"
            exit 1
        fi
    fi
    if [[ ! -d $work_dir ]]; then
        if ! mkdir -p "$work_dir"; then
            echo "$pkg: failed to make run directory: $work_dir"
            exit 1
        fi
    fi
}

_preflight(){
    ## check that required tools are installed
    for cli in git python; do
        if ! type "$cli" > /dev/null 2>&1; then
            _message-error-exit "$pkg: $cli is not in the PATH. Aborting." 1
        fi
    done

    ## determine which way to reverse cat a file
    if [[ $system == Linux ]]; then
        tac=tac
    elif [[ $system == Darwin ]]; then
        tac="tail -r"
    else
        _message-error-exit "unsupported platform: $system" 1
    fi
}

_cleanup(){
    if [[ -d $work_dir ]]; then
      if ! rm -rf "$work_dir"; then
        echo "$pkg: failed to remove directory: $work_dir"
        exit 1
      fi
    fi
    msg="deleted work directory"
    if [[ -d python-venv ]]; then
      if ! rm -rf "python-venv"; then
        echo "$pkg: failed to remove directory: python-venv"
        exit 1
      fi
    fi
    msg="deleted python-venv directory"
  _message-logger 
}


#####################################################################
## Main functions
#####################################################################
_main(){
  _message "this is our main function"
  ## here's a sample command
  sleep 5
}


#####################################################################
## Startup 
#####################################################################
_logo
_message-header "starting $(date +'%H:%M %p') on ${log_date}"
_basedirs
msg="-- starting --"
_message-logger 
_message-header "checking requirements"
_preflight
_message "preflight successful"


#####################################################################
## Main 
#####################################################################
_message-header "starting main functions"
_main

#####################################################################
## Successful exit
#####################################################################
_message-header "all tasks completed"
time_end=$(date +%s)
run_time=$(python -c "print '%u:%02u' % ((${time_end} - ${time_start})/60, (${time_end} - ${time_start})%60)")
_message "runtime: ${run_time}"

##_cleanup
msg="-- exiting --"
_message-logger 

exit 0
