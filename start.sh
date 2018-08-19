#! /bin/bash

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

echo ${BUCKET}:${ACCESS_KEY_ID}:${ACCESS_KEY_SECRET} > /etc/passwd-ossfs

chmod 640 /etc/passwd-ossfs

ossfs ${BUCKET} /oss -ourl=$OSS_ENDPOINT

cron -f