FROM tomcat:8.5.31-jre8
ENV LANG C.UTF-8
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ENV JAVA_OPTS "-Xms256m -Xmx512m -Xss1024K -XX:PermSize=256m -XX:MaxPermSize=256m"
ENV CATALINA_HOME /usr/local/tomcat
ADD ./ssm  /usr/local/tomcat/webapps
ENV PATH $PATH:$CATALINA_HOME/bin
CMD catalina.sh run
