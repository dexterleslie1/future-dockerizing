编译镜像
docker build -t registry.cn-hangzhou.aliyuncs.com/future-common/rabbitmq .
推送镜像
docker push registry.cn-hangzhou.aliyuncs.com/future-common/rabbitmq
启动容器
docker run --restart always --name rabbitmq -d -p 15672:15672 -p 5672:5672 registry.cn-hangzhou.aliyuncs.com/future-common/rabbitmq