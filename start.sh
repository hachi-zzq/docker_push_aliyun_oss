#! /bin/bash

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

echo "*/1 * * * * env >> /var/log/env.log" >> /var/spool/cron/crontabs/root 
echo "0 2 * * * /bin/tar_storage.sh > /var/log/crond.log" >> /var/spool/cron/crontabs/root 

echo ${BUCKET}:${ACCESS_KEY_ID}:${ACCESS_KEY_SECRET} > /etc/passwd-ossfs

chmod 640 /etc/passwd-ossfs

ossfs ${BUCKET} /oss -ourl=$OSS_ENDPOINT

cron -f