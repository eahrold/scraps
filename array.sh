#!/bin/bash

# array=($(ls -al | awk '{print $3}'))
# 
# for i in "${array[@]}"
# do
# 	echo $i
# done

read -e  hello "please enter the netboot server"

echo $hello