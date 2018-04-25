From tomcat:8-jre8

COPY my-app/target/my-app-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/myapp.war

