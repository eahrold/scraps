#!/bin/bash

set -x

eval_dir(){	 
# pass the name of the variable you want to eval
# so you would pass MYVAR rather than $MYVAR
eval local __myvar=${!1}
	if [ $? == 0 ]; then
		local __tilda=$(echo ${__myvar} | cut -c1)
		if [ ${__tilda} == '~' ]; then
			eval local __home="~"
			__myvar="${__home}${__myvar:1}"
		fi
			
		local __len=${#__myvar}-1
		if [ "${__myvar:__len}" != "/" ]; then
		  __myvar=$__myvar"/"
		fi
		eval $1="'$__myvar'"
	else
		return 1
	fi
}
