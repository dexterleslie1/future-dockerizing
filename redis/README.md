���뾵��
docker build -t registry.cn-hangzhou.aliyuncs.com/future-common/redis .
���;���
docker push registry.cn-hangzhou.aliyuncs.com/future-common/redis
��������
docker run --restart always -d --name redis -v /data/redis:/var/lib/redis -p6379:6379 registry.cn-hangzhou.aliyuncs.com/future-common/redis