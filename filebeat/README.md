���뾵��
docker build -t registry.cn-hangzhou.aliyuncs.com/future-common/filebeat .
���;���
docker push registry.cn-hangzhou.aliyuncs.com/future-common/filebeat
��������
docker run --restart always -d --name filebeat -v /data/filebeat/filebeat.yml:/etc/filebeat/filebeat.yml -v /data/filebeat/:/var/log/filebeat-mnt registry.cn-hangzhou.aliyuncs.com/future-common/filebeat

ʹ��filebeat��ȡ��־ǰ����Ҫ����-vӳ����������־��filebeat�����ڣ�����filebeat.yml��ȡ��־