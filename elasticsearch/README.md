���뾵��
docker build -t registry.cn-hangzhou.aliyuncs.com/future-common/elasticsearch .
���;���
docker push registry.cn-hangzhou.aliyuncs.com/future-common/elasticsearch

����������vm.max_map_count�������༭/etc/sysctl.conf�����������
https://stackoverflow.com/questions/51445846/elastic-search-max-virtual-memory-areas-vm-max-map-count-65530-is-too-low-inc
vm.max_map_count=262144

�޸�������volumeȨ��
chmod -R o+w /data/elasticsearch

��������
docker run --restart always -d --name elasticsearch -v /data/elasticsearch/data:/var/lib/elasticsearch -v /data/elasticsearch/log:/var/log/elasticsearch -p9200:9200 -p9300:9300 registry.cn-hangzhou.aliyuncs.com/future-common/elasticsearch

��������ʱ������;
docker run -it --rm --name=testES registry.cn-hangzhou.aliyuncs.com/future-common/elasticsearch /bin/bash
docker run -it --name elasticsearch -v /data/elasticsearch/data:/var/lib/elasticsearch -v /data/elasticsearch/log:/var/log/elasticsearch -p9200:9200 registry.cn-hangzhou.aliyuncs.com/future-common/elasticsearch