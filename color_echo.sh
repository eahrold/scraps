#!/bin/sh


cread(){	
	case "$1" in
		alert) local COLOR=$(printf "\\e[1;31m")
		;;
		warn|warning) local COLOR=$(printf "\\e[1;35m")
		;;
		attention) local COLOR=$(printf "\\e[1;32m")
		;;
		notice) local COLOR=$(printf "\\e[1;34m")
		;;
		*) local COLOR=$(printf "\\e[0;30m")
		;;
	esac
	
	local MESSAGE="${2}"
	local RESET=$(printf "\\e[0m")	
	read -e -p "${COLOR}${MESSAGE}${RESET} " VAR
	eval $3="'$VAR'"
	
}

cecho(){	
	case "$1" in
		alert) local COLOR=$(printf "\\e[1;31m")
		;;
		warn) local COLOR=$(printf "\\e[1;35m")
		;;
		attention) local COLOR=$(printf "\\e[1;32m")
		;;
		notice) local COLOR=$(printf "\\e[1;34m")
		;;
		*) local COLOR=$(printf "\\e[0;30m")
		;;
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
cecho warn "hello my warn"
cecho attention "hello my attention"
cecho notice "hello my notice"
cecho "hello my none"

cread alert "what is this?" REPLY

if [[ $REPLY =~ ^[Yy]$ ]];then
	echo yes
elif [[ $REPLY =~ ^[Nn]$ ]];then
	echo no
elif [[ $REPLY =~ ^[Mm]$ ]];then
	echo maybe
fi
