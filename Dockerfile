# Use official Tomcat base image
FROM tomcat:9.0-jdk17-temurin

# Disable Tomcat shutdown port (prevents warnings)
RUN sed -i 's/port="8005"/port="-1"/' /usr/local/tomcat/conf/server.xml

# Remove default ROOT app
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file as ROOT.war so it's served at "/"
COPY Watch2Gether.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080 (Render will map this)
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
