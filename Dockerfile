FROM tomcat:latest
RUN cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps


# RUN cp -R  /usr/local/tomcat/webapps.dist/*  /usr/local/tomcat/webapps
# RUN chmod +x /opt/tomcat/bin/startup.sh
# COPY ./*.war /usr/local/tomcat/webapps
