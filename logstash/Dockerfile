FROM qaware/centos7-jdk8

MAINTAINER dexterleslie@gmail.com

RUN rm -f /etc/localtime && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN curl --silent --output logstash-6.7.1.rpm https://bucketxy.oss-cn-hangzhou.aliyuncs.com/logstash-rpms/logstash-6.7.1.rpm

RUN yum install logstash-6.7.1.rpm -y

RUN rm -rf logstash-6.7.1.rpm

EXPOSE 5044

CMD ["/usr/share/logstash/bin/logstash","-f","/etc/logstash/logstash.conf"]
