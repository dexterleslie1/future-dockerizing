FROM centos:7.6.1810

MAINTAINER dexterleslie@gmail.com

RUN rm -f /etc/localtime && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN curl --silent --output redis-5.0.5-1.el7.remi.x86_64.rpm https://bucketxy.oss-cn-hangzhou.aliyuncs.com/redis-rpms/redis-5.0.5-1.el7.remi.x86_64.rpm

RUN yum install redis-5.0.5-1.el7.remi.x86_64.rpm -y

RUN rm -rf redis-5.0.5-1.el7.remi.x86_64.rpm

RUN sed -i -e 's@bind 127.0.0.1@bind 0.0.0.0@g' /etc/redis.conf
RUN sed -i -e 's@protected-mode yes@protected-mode no@g' /etc/redis.conf
RUN sed -i -e 's@daemonize yes@daemonize no@g' /etc/redis.conf
RUN sed -i -e 's@logfile /var/log/redis/redis.log@#logfile /var/log/redis/redis.log@g' /etc/redis.conf

EXPOSE 6379

CMD ["/usr/bin/redis-server","/etc/redis.conf"]
