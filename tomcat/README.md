±àÒë¾µÏñ
docker build -t registry.cn-hangzhou.aliyuncs.com/future-common/tomcat .
ÍÆËÍ¾µÏñccc
docker push registry.cn-hangzhou.aliyuncs.com/future-common/tomcat
Æô¶¯ÈÝÆ÷
docker run --restart always -d --name tomcat -e JAVA_OPTS="-Xmx512m -Xms256m" -p8080:8080 registry.cn-hangzhou.aliyuncs.com/future-common/tomcat