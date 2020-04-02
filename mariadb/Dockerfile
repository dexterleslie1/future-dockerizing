FROM centos:7.6.1810

MAINTAINER dexterleslie@gmail.com

RUN rm -f /etc/localtime && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN set -ex; \
	groupadd -r mysql; \
	useradd -r -g mysql mysql

RUN mkdir /docker-entrypoint-initdb.d

RUN curl --silent --output /root/boost-program-options-1.53.0-27.el7.x86_64.rpm https://bucketxy.oss-cn-hangzhou.aliyuncs.com/MariaDB-10.3.10-centos73-x86_64/boost-program-options-1.53.0-27.el7.x86_64.rpm
RUN curl --silent --output /root/galera-25.3.24-1.rhel7.el7.centos.x86_64.rpm https://bucketxy.oss-cn-hangzhou.aliyuncs.com/MariaDB-10.3.10-centos73-x86_64/galera-25.3.24-1.rhel7.el7.centos.x86_64.rpm
RUN curl --silent --output /root/jemalloc-3.6.0-1.el7.x86_64.rpm https://bucketxy.oss-cn-hangzhou.aliyuncs.com/MariaDB-10.3.10-centos73-x86_64/jemalloc-3.6.0-1.el7.x86_64.rpm
RUN curl --silent --output /root/libzstd-1.3.4-1.el7.x86_64.rpm https://bucketxy.oss-cn-hangzhou.aliyuncs.com/MariaDB-10.3.10-centos73-x86_64/libzstd-1.3.4-1.el7.x86_64.rpm
RUN curl --silent --output /root/MariaDB-10.3.10-centos73-x86_64-client.rpm https://bucketxy.oss-cn-hangzhou.aliyuncs.com/MariaDB-10.3.10-centos73-x86_64/MariaDB-10.3.10-centos73-x86_64-client.rpm
RUN curl --silent --output /root/MariaDB-10.3.10-centos73-x86_64-common.rpm https://bucketxy.oss-cn-hangzhou.aliyuncs.com/MariaDB-10.3.10-centos73-x86_64/MariaDB-10.3.10-centos73-x86_64-common.rpm
RUN curl --silent --output /root/MariaDB-10.3.10-centos73-x86_64-compat.rpm https://bucketxy.oss-cn-hangzhou.aliyuncs.com/MariaDB-10.3.10-centos73-x86_64/MariaDB-10.3.10-centos73-x86_64-compat.rpm
RUN curl --silent --output /root/MariaDB-10.3.10-centos73-x86_64-server.rpm https://bucketxy.oss-cn-hangzhou.aliyuncs.com/MariaDB-10.3.10-centos73-x86_64/MariaDB-10.3.10-centos73-x86_64-server.rpm
RUN curl --silent --output /root/perl-Compress-Raw-Bzip2-2.061-3.el7.x86_64.rpm https://bucketxy.oss-cn-hangzhou.aliyuncs.com/MariaDB-10.3.10-centos73-x86_64/perl-Compress-Raw-Bzip2-2.061-3.el7.x86_64.rpm
RUN curl --silent --output /root/perl-Compress-Raw-Zlib-2.061-4.el7.x86_64.rpm https://bucketxy.oss-cn-hangzhou.aliyuncs.com/MariaDB-10.3.10-centos73-x86_64/perl-Compress-Raw-Zlib-2.061-4.el7.x86_64.rpm
RUN curl --silent --output /root/perl-Data-Dumper-2.145-3.el7.x86_64.rpm https://bucketxy.oss-cn-hangzhou.aliyuncs.com/MariaDB-10.3.10-centos73-x86_64/perl-Data-Dumper-2.145-3.el7.x86_64.rpm
RUN curl --silent --output /root/perl-DBI-1.627-4.el7.x86_64.rpm https://bucketxy.oss-cn-hangzhou.aliyuncs.com/MariaDB-10.3.10-centos73-x86_64/perl-DBI-1.627-4.el7.x86_64.rpm
RUN curl --silent --output /root/perl-IO-Compress-2.061-2.el7.noarch.rpm https://bucketxy.oss-cn-hangzhou.aliyuncs.com/MariaDB-10.3.10-centos73-x86_64/perl-IO-Compress-2.061-2.el7.noarch.rpm
RUN curl --silent --output /root/perl-Net-Daemon-0.48-5.el7.noarch.rpm https://bucketxy.oss-cn-hangzhou.aliyuncs.com/MariaDB-10.3.10-centos73-x86_64/perl-Net-Daemon-0.48-5.el7.noarch.rpm
RUN curl --silent --output /root/perl-PlRPC-0.2020-14.el7.noarch.rpm https://bucketxy.oss-cn-hangzhou.aliyuncs.com/MariaDB-10.3.10-centos73-x86_64/perl-PlRPC-0.2020-14.el7.noarch.rpm

WORKDIR /root
RUN yum remove mysql-libs -y
RUN yum -y install *.rpm

RUN rm -f *.rpm

RUN localedef -c -f UTF-8 -i zh_CN zh_CN.utf8
ENV LANG zh_CN.utf8

ADD server.conf /etc/my.cnf.d/server.cnf

EXPOSE 3306

COPY entrypoint.sh /usr/local/bin
ENTRYPOINT ["sh","/usr/local/bin/entrypoint.sh"]
CMD ["mysqld_safe","--user=mysql"]
