FROM tomcat:9.0-jdk17

# Copy WAR file
COPY BBWork.war /usr/local/tomcat/webapps/

# Update Tomcat's server.xml to use the dynamic Render port
RUN sed -i 's/port="8080"/port="${PORT}"/' /usr/local/tomcat/conf/server.xml

# Start Tomcat
CMD ["catalina.sh", "run"]
