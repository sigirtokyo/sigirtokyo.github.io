#!/bin/sh
REMOTE_BASE_URL=http://mpkato.net/sigirtokyo_preview/
CONFIG_FILE=config.toml
TMP_CONFIG_FILE=./config.dev.toml
SCRIPT_DIR=$(cd $(dirname $0);pwd)
PWD=$(pwd)

# check the current dir
if [ ! $SCRIPT_DIR = $PWD ]; then
    echo "Run this script at the same directory as that of the script."
    exit
fi
if [ ! -f $CONFIG_FILE ]; then
    echo "Run this script at the same directory as that of $CONFIG_FILE."
    exit
fi

# remove public/
rm -rf $SCRIPT_DIR/public

# config file for dev
cat $CONFIG_FILE | sed -e "s/^[ ]*baseurl.*/baseurl = \"${REMOTE_BASE_URL//\//\\/}\"/g" > $TMP_CONFIG_FILE
hugo --config $TMP_CONFIG_FILE
rm -f $TMP_CONFIG_FILE

# rsync with a remote server
rsync -ahv --delete $SCRIPT_DIR/public/ sigirtokyo@mpkato.net:~/public_html/sigirtokyo_preview/
