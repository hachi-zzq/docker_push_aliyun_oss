#! /bin/bash
date=$(date -d '+0 hours' +%Y%m%d%H%M%S)

cd /share && tar -jvcf "/share/$date.tar.bz2" * && mv "/share/$date.tar.bz2" /oss/