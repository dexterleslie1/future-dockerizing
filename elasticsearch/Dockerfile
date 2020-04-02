FROM qaware/centos7-jdk8

MAINTAINER dexterleslie@gmail.com

RUN rm -f /etc/localtime && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN curl --silent --output elasticsearch-6.7.1.rpm https://bucketxy.oss-cn-hangzhou.aliyuncs.com/elasticsearch-rpms/elasticsearch-6.7.1.rpm
RUN yum install elasticsearch-6.7.1.rpm -y

RUN rm -rf elasticsearch-6.7.1.rpm

RUN sed -i -e 's@#network.host: 192.168.0.1@network.host: 0.0.0.0@g' /etc/elasticsearch/elasticsearch.yml
RUN echo 'http.cors.enabled: true' >> /etc/elasticsearch/elasticsearch.yml
RUN echo 'http.cors.allow-origin: "*"' >> /etc/elasticsearch/elasticsearch.yml

RUN yum install -y unzip
RUN curl --silent --output elasticsearch-analysis-ik-6.7.1.zip https://bucketxy.oss-cn-hangzhou.aliyuncs.com/elasticsearch-rpms/elasticsearch-analysis-ik-6.7.1.zip
RUN unzip elasticsearch-analysis-ik-6.7.1.zip -d /usr/share/elasticsearch/plugins/ik
RUN rm -f elasticsearch-analysis-ik-6.7.1.zip

COPY entrypoint.sh /usr/local/bin

EXPOSE 9200

#VOLUME ["/var/lib/elasticsearch","/var/log/elasticsearch"]

USER elasticsearch

#RUN chown -R elasticsearch:elasticsearch /var/log/elasticsearch/
#RUN chown -R elasticsearch:elasticsearch /var/lib/elasticsearch/

CMD ["/usr/share/elasticsearch/bin/elasticsearch"]

ENTRYPOINT ["sh","/usr/local/bin/entrypoint.sh"]
