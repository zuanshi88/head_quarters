#!/bin/bash 

#This happens because "$*" combines all arguments into a single string, while "$@" requotes the individual arguments.

echo "this is inside showargs"
echo $* 
echo $@ 
echo "this is same command but in quotes"
echo "$*"
echo "$@"
echo "here we call print12 with commands are args!!"
bash print12.sh "$*"
bash print12.sh "$@"
echo "here print12 is passed with integer args"
bash print12.sh 2 3 
bash print12.sh "Tom" "Jerry"