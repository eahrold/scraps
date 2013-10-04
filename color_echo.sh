#!/bin/sh



cecho(){	
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
	
	if [ -z "${2}" ]
		local MESSAGE="${1}"
	else
		local MESSAGE="${2}"

	local RESET=$(printf "\\e[0m")	
	echo "${COLOR}${MESSAGE}${RESET}" ${3}	
}

cecho alert "hello my alert" "what's new"
cecho warn "hello my warn"
cecho attention "hello my attention"
cecho notice "hello my notice"
cecho "hello my none"