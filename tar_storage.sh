#! /bin/bash
date=$(date -d '+0 days' +%Y%m%d)

cd /share && tar -jvcf "/share/$date.tar.bz2" * && mv "/share/$date.tar.bz2" /oss/