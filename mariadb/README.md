���뾵��
docker build -t registry.cn-hangzhou.aliyuncs.com/future-common/mariadb .
���;���
docker push registry.cn-hangzhou.aliyuncs.com/future-common/mariadb
��������
docker run --restart always -d --name mariadb -v ~/data-mariadb:/var/lib/mysql -p3306:3306 registry.cn-hangzhou.aliyuncs.com/future-common/mariadb
