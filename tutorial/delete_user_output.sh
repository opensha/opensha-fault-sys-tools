#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

cd $DIR

for SUB in `find -maxdepth 2 -name 'user_output'`;do
	echo "clearing $SUB"
	cd $DIR
	cd $SUB
	find . -maxdepth 1 -mindepth 1 ! -name 'README.md' -exec rm -rf {} \;
done
