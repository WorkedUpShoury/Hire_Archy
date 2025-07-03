FROM tomcat:9.0-jdk17
COPY target/Hirearchy.war /usr/local/tomcat/webapps/Hirearchy.war
EXPOSE 8080
