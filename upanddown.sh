#!/bin/bash

while [ 1 = 1 ]; do
ifconfig en0 up
echo up
sleep 3

ifconfig en0 down
echo and down
sleep 5
done

