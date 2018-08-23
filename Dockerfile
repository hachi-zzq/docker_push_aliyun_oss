FROM ubuntu:16.04

ADD http://docs-aliyun.cn-hangzhou.oss.aliyun-inc.com/assets/attach/32196/cn_zh/1527232098199/ossfs_1.80.5_ubuntu16.04_amd64.deb /tmp

RUN apt-get -y update && \
	apt-get -y install gdebi-core && \
	apt-get -y install cron && \
	apt-get -y install bzip2 && \
	apt-get -y install tzdata && \
	apt-get -y install vim && \
	gdebi -n /tmp/ossfs_1.80.5_ubuntu16.04_amd64.deb


COPY start.sh /tmp/start.sh
COPY tar_storage.sh /bin/tar_storage.sh

RUN chmod a+x /tmp/start.sh && \
	chmod a+x /bin/tar_storage.sh && \
	mkdir /oss && \
	mkdir /share && \
 	cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
 	echo "*/1 * * * * env >> /var/log/env.log" >> /var/spool/cron/crontabs/root 
	echo "*/2 * * * * /bin/tar_storage.sh > /var/log/crond.log" >> /var/spool/cron/crontabs/root 

VOLUME ["/share"]

CMD ["/tmp/start.sh"]