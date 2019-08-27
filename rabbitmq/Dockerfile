#基础镜像
FROM centos:7.6.1810

#设置编码为中文
RUN rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN localedef -c -f UTF-8 -i zh_CN zh_CN.utf8
ENV LC_ALL zh_CN.utf8

COPY erlang-21.3.4-1.el6.x86_64.rpm erlang-21.3.4-1.el6.x86_64.rpm
COPY rabbitmq-server-3.7.14-1.el7.noarch.rpm rabbitmq-server-3.7.14-1.el7.noarch.rpm
COPY rabbitmq_delayed_message_exchange-20171201-3.7.x.ez rabbitmq_delayed_message_exchange-20171201-3.7.x.ez


#安装erlang
RUN rpm -Uvh erlang-21.3.4-1.el6.x86_64.rpm

#安装rabbitmq
RUN rpm --import http://www.rabbitmq.com/rabbitmq-signing-key-public.asc

RUN yum install -y rabbitmq-server-3.7.14-1.el7.noarch.rpm

#将队列延迟插件拷贝到rabbitmq插件目录
RUN cp /rabbitmq_delayed_message_exchange-20171201-3.7.x.ez /usr/lib/rabbitmq/lib/rabbitmq_server-3.7.14/plugins

#安装常用插件
RUN /usr/sbin/rabbitmq-plugins enable --offline rabbitmq_management rabbitmq_delayed_message_exchange <<<'y'

#添加配置文件
ADD rabbitmq.config /etc/rabbitmq/

#添加cookie，使集群环境中的机器保持互通
#ADD erlang.cookie /var/lib/rabbitmq/.erlang.cookie

#添加启动容器时执行的脚本，主要根据启动时的入参做集群设置
ADD entrypoint.sh /opt/rabbit/

#给相关资源赋予权限
RUN chmod u+rw /etc/rabbitmq/rabbitmq.config \
&& mkdir -p /opt/rabbit \
&& chmod a+x /opt/rabbit/entrypoint.sh

#暴露常用端口
EXPOSE 5672
EXPOSE 15672

#设置容器创建时执行的脚本
CMD /opt/rabbit/entrypoint.sh