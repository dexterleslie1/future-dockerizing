��¡Դ���뵽��ǰĿ¼
git clone git://github.com/mobz/elasticsearch-head.git .

���뾵��
docker build -t registry.cn-hangzhou.aliyuncs.com/future-common/elasticsearch-head .

���;���
docker push registry.cn-hangzhou.aliyuncs.com/future-common/elasticsearch-head

��������
docker run --restart always -d --name elasticsearch-head -p9100:9100 registry.cn-hangzhou.aliyuncs.com/future-common/elasticsearch-head