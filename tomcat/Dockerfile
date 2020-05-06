FROM tomcat:9.0

RUN chmod -R o-rwx /usr/local/tomcat
RUN chmod -R g-rwx /usr/local/tomcat
RUN chmod -R u-w /usr/local/tomcat/bin
RUN chmod -R u-w /usr/local/tomcat/conf
RUN chmod -R u-w /usr/local/tomcat/lib
RUN chmod -R u-w /usr/local/tomcat/webapps
RUN chmod -R u-w /usr/local/tomcat/logs
RUN chmod -R u-w /usr/local/tomcat/temp
RUN chmod -R u-w /usr/local/tomcat/work

RUN rm -rf /usr/local/tomcat/include
RUN rm -rf /usr/local/tomcat/native-jni-lib
RUN rm -rf /usr/local/tomcat/webapps.dist

RUN sed -i '/org.apache.catalina.valves.AccessLogValve/i \\t<!--' /usr/local/tomcat/conf/server.xml
RUN sed -i '/pattern="%h %l %u %t &quot;%r&quot; %s %b"/a \\t-->' /usr/local/tomcat/conf/server.xml

# https://www.thegeekstuff.com/2013/08/hide-tomcat-version-number/
RUN mkdir -p /usr/local/tomcat/lib/org/apache/catalina/util
RUN echo "server.info=Apache Server" > /usr/local/tomcat/lib/org/apache/catalina/util/ServerInfo.properties
