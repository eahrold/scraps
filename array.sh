#!/bin/bash

# array=($(ls -al | awk '{print $3}'))
# 
# for i in "${array[@]}"
# do
# 	echo $i
# done

read -e "please enter the netboot server" hello

echo $hello