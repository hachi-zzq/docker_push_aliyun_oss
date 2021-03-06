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
COPY tar_storage.sh /etc/cron.daily/tar_storage

RUN chmod a+x /tmp/start.sh && \
	mkdir /oss && \
	mkdir /share && \
 	cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
 	chmod 0755 /etc/cron.daily/tar_storage

VOLUME ["/share"]

CMD ["/tmp/start.sh"]