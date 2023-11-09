FROM tomcat
COPY target/TrainBook-1.0.0-SNAPSHOT.war /usr/local/tomcat/webapps/Trainbook.war
CMD ["catalina.sh", "run"]