#!/bin/bash

set -x

ised(){
	sed -i "" -e "s;^${1}.*;${2};" "${3}"
}