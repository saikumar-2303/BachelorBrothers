FROM tomcat:9.0-jdk17

# Copy the WAR file into the Tomcat webapps directory
COPY BBWork.war /usr/local/tomcat/webapps/

# Replace the default port 8080 with the one provided by Render ($PORT)
RUN sed -i 's/port="8080"/port="${PORT}"/' /usr/local/tomcat/conf/server.xml

# Debug: Print the value of $PORT and the updated server.xml
RUN echo "Render will inject PORT at runtime" && \
    echo "Sample server.xml connector line:" && \
    grep 'Connector' /usr/local/tomcat/conf/server.xml || echo "Connector not found"

# Start Tomcat
CMD ["catalina.sh", "run"]
