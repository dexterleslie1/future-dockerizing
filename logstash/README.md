���뾵��
docker build -t registry.cn-hangzhou.aliyuncs.com/future-common/logstash .
���;���
docker push registry.cn-hangzhou.aliyuncs.com/future-common/logstash
��������
docker run --restart always -d --name logstash -p5044:5044 -v /data/logstash/logstash.conf:/etc/logstash/logstash.conf registry.cn-hangzhou.aliyuncs.com/future-common/logstash