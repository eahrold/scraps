#!/bin/bash

# array=($(ls -al | awk '{print $3}'))
# 
# for i in "${array[@]}"
# do
# 	echo $i
# done

read -p "Please Specify a Netboot Server's IP: " nbs


echo $nbs