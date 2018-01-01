#!/bin/sh
REMOTE_BASE_URL=http://mpkato.net/sigirtokyo_preview/
TMP_CONFIG_FILE=./config.dev.toml

# config file for dev
cat config.toml | sed -e "s/^[ ]*baseurl.*/baseurl = \"${REMOTE_BASE_URL//\//\\/}\"/g" > $TMP_CONFIG_FILE
hugo --config $TMP_CONFIG_FILE
rm -f $TMP_CONFIG_FILE

# rsync with a remote server
rsync -ahv --delete public/ sigirtokyo@mpkato.net:~/public_html/sigirtokyo_preview/
