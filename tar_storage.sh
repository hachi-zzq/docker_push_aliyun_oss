#! /bin/bash
date=$(date -d '+0 days' +%Y%m%d)

tar -jvcf "/share/$date.tar.bz2" /share/* && mv "/share/$date.tar.bz2" /oss/