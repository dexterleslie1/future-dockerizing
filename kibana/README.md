±àÒë¾µÏñ
docker build -t registry.cn-hangzhou.aliyuncs.com/future-common/kibana .
ÍÆËÍ¾µÏñ
docker push registry.cn-hangzhou.aliyuncs.com/future-common/kibana
Æô¶¯ÈİÆ÷
docker run --restart always -d --name kibana -v /data/kibana/kibana.yml:/etc/kibana/kibana.yml -p5601:5601 registry.cn-hangzhou.aliyuncs.com/future-common/kibana