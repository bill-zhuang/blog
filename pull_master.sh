#!/bin/bash
cd your-project-path
git remote update
current_branch=$(git symbolic-ref --short HEAD)
if [ $current_branch = "master" ]; then
	git pull origin master
else
	git ck master
	git pull origin master
	git ck -
fi
echo 'Branch master updated!'