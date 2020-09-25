#Dockerfile
FROM sainava225/tomcat-java8
MAINTAINER TEJA
COPY target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
WORKDIR /usr/local/tomcat/bin
CMD catalina.sh run
