#!/bin/sh


cread(){	
	case "$1" in
		red|alert) local COLOR=$(printf "\\e[1;31m");;
		green|attention) local COLOR=$(printf "\\e[1;32m");;
		yellow|warn) local COLOR=$(printf "\\e[1;33m");;
		blue|question) local COLOR=$(printf "\\e[1;34m");;
		purple|info) local COLOR=$(printf "\\e[1;35m");;
		cyan|notice) local COLOR=$(printf "\\e[1;36m");;
		bold|prompt) local COLOR=$(printf "\\e[1;30m");;
		*) local COLOR=$(printf "\\e[0;30m");;
	esac
	
	local MESSAGE="${2}"
	local RESET=$(printf "\\e[0m")	
	if [ -z ${3} ];then
		read -e -p "${COLOR}${MESSAGE}${RESET} "
	else
		read -e -p "${COLOR}${MESSAGE}${RESET} " VAR
		eval $3="'$VAR'"
	fi
	
}

cecho(){	
	case "$1" in
		red|alert) local COLOR=$(printf "\\e[1;31m");;
		green|attention) local COLOR=$(printf "\\e[1;32m");;
		yellow|warn) local COLOR=$(printf "\\e[1;33m");;
		blue|question) local COLOR=$(printf "\\e[1;34m");;
		purple|info) local COLOR=$(printf "\\e[1;35m");;
		cyan|notice) local COLOR=$(printf "\\e[1;36m");;
		bold|prompt) local COLOR=$(printf "\\e[1;30m");;
		*) local COLOR=$(printf "\\e[0;30m");;
	esac
	
	
	if [ -z "${2}" ];then
		local MESSAGE="${1}"
	else
		local MESSAGE="${2}"
	fi

	local RESET=$(printf "\\e[0m")	
	echo "${COLOR}${MESSAGE}${RESET} ${3}"	
}

cecho alert "hello my alert:" "what's new"
cecho prompt "hello my prompt:" "what's new"
cecho question "what's up"
cecho warn "hello my warn"
cecho attention "hello my attention"
cecho notice "hello my notice"
cecho "hello my none"

cread alert "what is this?"

if [[ $REPLY =~ ^[Yy]$ ]];then
	echo yes
elif [[ $REPLY =~ ^[Nn]$ ]];then
	echo no
elif [[ $REPLY =~ ^[Mm]$ ]];then
	echo maybe
fi
