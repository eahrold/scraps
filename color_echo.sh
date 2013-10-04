#!/bin/sh



cecho(){	
	case "$2" in
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
		
	local MESSAGE=$1
	local RESET=$(printf "\\e[0m")	
	echo "${COLOR}${MESSAGE}${RESET}"	
}

cecho "hello my alert" alert
cecho "hello my warn" warn
cecho "hello my attention" attention
cecho "hello my notice" notice
cecho "hello my none"