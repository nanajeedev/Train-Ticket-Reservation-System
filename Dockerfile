FROM tomcat

COPY target/TrainBook-1.0.0-SNAPSHOT.war /usr/local/tomcat/webapps/

EXPOSE 8083

CMD ["catalina.sh", "run"]