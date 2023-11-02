FROM tomcat

COPY target/TrainBook-1.0.0-SNAPSHOT.war /usr/local/tomcat/webapps/trainbook.war

EXPOSE 8084

CMD ["catalina.sh", "run"]