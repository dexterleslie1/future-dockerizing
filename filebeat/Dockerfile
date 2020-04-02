FROM centos:7.6.1810

MAINTAINER dexterleslie@gmail.com

RUN rm -f /etc/localtime && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN curl --silent --output filebeat-6.7.1-x86_64.rpm https://bucketxy.oss-cn-hangzhou.aliyuncs.com/filebeat-rpms/filebeat-6.7.1-x86_64.rpm

RUN yum install filebeat-6.7.1-x86_64.rpm -y

RUN rm -rf filebeat-6.7.1-x86_64.rpm

CMD ["/usr/share/filebeat/bin/filebeat","-c","/etc/filebeat/filebeat.yml","-path.home","/usr/share/filebeat","-path.config","/etc/filebeat","-path.data","/var/lib/filebeat","-e"]
