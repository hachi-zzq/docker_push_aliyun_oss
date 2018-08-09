#! /bin/bash

echo ${BUCKET}:${ACCESS_KEY_ID}:${ACCESS_KEY_SECRET} > /etc/passwd-ossfs

chmod 640 /etc/passwd-ossfs

ossfs ${BUCKET} /oss -ourl=$OSS_ENDPOINT

cron -f