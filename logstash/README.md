±àÒë¾µÏñ
docker build -t registry.cn-hangzhou.aliyuncs.com/future-common/logstash .
ÍÆËÍ¾µÏñ
docker push registry.cn-hangzhou.aliyuncs.com/future-common/logstash
Æô¶¯ÈÝÆ÷
docker run --restart always -d --name logstash -p5044:5044 -v /data/logstash/logstash.conf:/etc/logstash/logstash.conf registry.cn-hangzhou.aliyuncs.com/future-common/logstash