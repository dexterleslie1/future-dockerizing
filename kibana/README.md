���뾵��
docker build -t registry.cn-hangzhou.aliyuncs.com/future-common/kibana .
���;���
docker push registry.cn-hangzhou.aliyuncs.com/future-common/kibana
��������
docker run --restart always -d --name kibana -v /data/kibana/kibana.yml:/etc/kibana/kibana.yml -p5601:5601 registry.cn-hangzhou.aliyuncs.com/future-common/kibana