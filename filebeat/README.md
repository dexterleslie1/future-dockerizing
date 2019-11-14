编译镜像
docker build -t registry.cn-hangzhou.aliyuncs.com/future-common/filebeat .
推送镜像
docker push registry.cn-hangzhou.aliyuncs.com/future-common/filebeat
启动容器
docker run --restart always -d --name filebeat -v /data/filebeat/filebeat.yml:/etc/filebeat/filebeat.yml -v /data/filebeat/:/var/log/filebeat-mnt registry.cn-hangzhou.aliyuncs.com/future-common/filebeat

使用filebeat提取日志前，需要配置-v映射宿主机日志到filebeat容器内，配置filebeat.yml提取日志