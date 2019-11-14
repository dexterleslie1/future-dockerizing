FROM qaware/centos7-jdk8

MAINTAINER dexterleslie@gmail.com

RUN rm -f /etc/localtime && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

COPY kibana-6.7.1-x86_64.rpm kibana-6.7.1-x86_64.rpm
RUN yum install kibana-6.7.1-x86_64.rpm -y

RUN rm -rf kibana-6.7.1-x86_64.rpm

EXPOSE 5601

CMD ["/usr/share/kibana/bin/kibana","-c","/etc/kibana/kibana.yml"]
