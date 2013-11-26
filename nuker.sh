#!/bin/bash

### NUKE Problem Files in User Home directories...

declare -a BAD_FOLDER_LIST=( '/Library/Application Support/'
							'/Library/Caches/'
							'/Library/Containers/'
							'/Library/Preferences/'
							'/Library/Saved Application State/')

declare -a BAD_FILE_LIST=()						

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
						

__do_nuke__(){
	echo nuking...
	if [ -n "$USER_HOME_DIR" ]; then
		if [ ${#BAD_FOLDER_LIST[@]} -gt 0 ]; then
			for i in "${BAD_FOLDER_LIST[@]}"; do
				eval REMOVING='${USER_HOME_DIR}${i}'
				if [ -d "${REMOVING}" ]; then
					cecho blue "removing problem files at ${REMOVING}*"
					rm -rvf "${REMOVING}"*
				else
					cecho red "folder ${REMOVING} not found";
				fi
			done;
		fi
	else
		echo "user directory not found"
	fi
}

__admin_nuke__(){
	if [ `whoami` != "root" ];then
		cecho red "adminuke must be run as root"
		exit 1
	fi
	
	read -e -p 'Which User to Nuke: ' NUKEUSER
	if [ -z "$NUKEUSER" ]; then 
		cecho red "Can't be blank. Try Again."
		exit 1
	else
		USERNAME="$NUKEUSER"
	fi
	
	LDAP_SERVER=`odutil show all | grep "/LDAPv3/"* | grep line | grep -v "X" | awk '{print $1}'`
	USER_HOME_DIR=`dscl "${LDAP_SERVER}" read /Users/"${USERNAME}"/ NFSHomeDirectory`
	
	if [ $? != 0 ] ;then 
		echo "that user name is not found..." 
		exit 1
	fi;

	eval USER_HOME_DIR=`echo $USER_HOME_DIR | awk '{print $2}'`
	
}

__user_nuke__(){
	[[ `groups | grep -c admin` -gt 0 ]] && cecho red "can't nuke an admin user" && exit 1; 
	eval USER_HOME_DIR="~"
}


__main__(){
	if [ "$1" == "adminuke" ] ; then 
		__admin_nuke__
	elif [ -n "$1" ] ; then 
		cecho red "Unknown command. Try again"
		exit 1
	else
		__user_nuke__
	fi
	
	__do_nuke__
	echo 'done.'
	exit 0;
	
}

__main__ $1