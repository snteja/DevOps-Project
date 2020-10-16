#Dockerfile
FROM sainava225/tomcat-java8
MAINTAINER TEJA
ADD  https://sainava-s3.s3.us-east-2.amazonaws.com/TechdatCommunicationss.war /usr/local/tomcat/webapps/TechdatCommunicationss.war
EXPOSE 8080
WORKDIR /usr/local/tomcat/bin
CMD ["catalina.sh", "run"]
