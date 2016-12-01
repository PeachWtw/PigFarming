#!/bin/bash
$( git add --all)
if [ $? -eq 0];then
	echo "git add --all failed"
	exit 1
fi

read -p "input your commend:"  comd

$(git commit -m "$comd")

if [ $? -eq 0];then
	echo "git commit -m  failed"
	exit 2

$(git push origin master)

if [ $? -eq 0];then
	echo "git push origin master"
	exit 3
