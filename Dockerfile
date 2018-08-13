FROM ubuntu:16.04

ADD http://docs-aliyun.cn-hangzhou.oss.aliyun-inc.com/assets/attach/32196/cn_zh/1527232098199/ossfs_1.80.5_ubuntu16.04_amd64.deb /tmp

RUN apt-get -y update && \
	apt-get -y install gdebi-core && \
	apt-get -y install cron && \
	apt-get -y install bzip2 && \
	gdebi -n /tmp/ossfs_1.80.5_ubuntu16.04_amd64.deb


COPY start.sh /bin/start.sh
COPY tar_storage.sh /bin/tar_storage.sh

RUN chmod a+x /bin/start.sh && \
	chmod a+x /bin/tar_storage.sh && \
	mkdir /oss && \
	mkdir /share && \

echo "0 18 * * * /bin/tar_storage.sh > /var/log/crond.log" >>/var/spool/cron/crontabs/root 

VOLUME ["/share"]

CMD ["/bin/start.sh"]
