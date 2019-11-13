编译镜像
docker build -t registry.cn-hangzhou.aliyuncs.com/future-common/elasticsearch .
推送镜像
docker push registry.cn-hangzhou.aliyuncs.com/future-common/elasticsearch

设置宿主机vm.max_map_count参数，编辑/etc/sysctl.conf添加以下内容
https://stackoverflow.com/questions/51445846/elastic-search-max-virtual-memory-areas-vm-max-map-count-65530-is-too-low-inc
vm.max_map_count=262144

修改宿主机volume权限
chmod -R o+w /data/elasticsearch

启动容器
docker run --restart always -d --name elasticsearch -v /data/elasticsearch/data:/var/lib/elasticsearch -v /data/elasticsearch/log:/var/log/elasticsearch -p9200:9200 -p9300:9300 registry.cn-hangzhou.aliyuncs.com/future-common/elasticsearch

创建容器时调试用途
docker run -it --rm --name=testES registry.cn-hangzhou.aliyuncs.com/future-common/elasticsearch /bin/bash
docker run -it --name elasticsearch -v /data/elasticsearch/data:/var/lib/elasticsearch -v /data/elasticsearch/log:/var/log/elasticsearch -p9200:9200 registry.cn-hangzhou.aliyuncs.com/future-common/elasticsearch