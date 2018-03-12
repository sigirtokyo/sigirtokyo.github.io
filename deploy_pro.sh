#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0);pwd)
PWD=$(pwd)

# check the current dir
if [ ! $SCRIPT_DIR = $PWD ]; then
    echo "Run this script at the same directory as that of the script."
    exit
fi

hugo

git checkout master

cp -rf public/* ./

git add .
git commit
git push
