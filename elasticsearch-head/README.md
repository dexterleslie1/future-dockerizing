克隆源代码到当前目录
git clone git://github.com/mobz/elasticsearch-head.git .

编译镜像
docker build -t registry.cn-hangzhou.aliyuncs.com/future-common/elasticsearch-head .

推送镜像
docker push registry.cn-hangzhou.aliyuncs.com/future-common/elasticsearch-head

启动容器
docker run --restart always -d --name elasticsearch-head -p9100:9100 registry.cn-hangzhou.aliyuncs.com/future-common/elasticsearch-head