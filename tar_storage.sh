#! /bin/sh

dir="/oss/$(date -d '+0 hours' +%Y)/$(date -d '+0 hours' +%m)"

if [ ! -d $dir ]; then
	mkdir -p $dir
fi

date=$(date -d '+0 hours' +%Y%m%d%H%M%S)

cd /share && tar -jvcf "/share/$date.tar.bz2" * && mv "/share/$date.tar.bz2" $dir