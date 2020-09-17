FROM sainava225/tomcat-java8
MAINTAINER TEJA
COPY DevOpsRocks.war /usr/local/tomcat/webapps/DevOpsRocks.war
EXPOSE 8080
WORKDIR /usr/local/tomcat/bin
CMD catalina.sh run
