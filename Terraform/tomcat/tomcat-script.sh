#!/bin/bash
# DadaKins9

# CES INSTALLATIONS NE MARCHENT PAS *********************
# install java
sudo su -
amazon-linux-extras install java-openjdk11

# install Tomcat
cd /opt
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.69/bin/apache-tomcat-9.0.69.tar.gz
tar -xvzf /opt/apache-tomcat-9.0.69.tar.gz
ln -s /opt/apache-tomcat-9.0.69/bin/startup.sh /usr/local/bin/tomcatup
ln -s /opt/apache-tomcat-9.0.69/bin/shutdown.sh /usr/local/bin/tomcatdown
chmod +x /opt/apache-tomcat-9.0.69/bin/startup.sh 
chmod +x /opt/apache-tomcat-9.0.69/bin/shutdown.sh
tomcatup

# Configure Tomcat
find /opt/apache-tomcat-9.0.69/webapps/ -name context.xml

################
ln -s /opt/apache-tomcat-9.0.69/bin/startup.sh /usr/local/bin/tomcatup
ln -s /opt/apache-tomcat-9.0.69/bin/shutdown.sh /usr/local/bin/tomcatdown

