#!/bin/bash

# install Java, Jenkins, git
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install -y openjdk-11-jre jenkins git

# enable and launch Jenkins
sudo systemctl enable jenkins && sudo systemctl start jenkins

# install Maven
cd /opt && sudo wget https://dlcdn.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.tar.gz
tar -xvzf apache-maven-3.8.6-bin.tar.gz && sudo mv apache-maven-3.8.6 maven

# Mise à jour du PATH
cd ~ && echo "M2_HOME=/opt/maven" >> .bash_profile && echo "M2=/opt/maven/bin" >> .bash_profile
echo "JAVA_HOME=$(sudo find / -name java-11* | grep jvm | grep -v -e debug -e share)" >> .bash_profile
echo "PATH=\$PATH:\$HOME/bin:\$JAVA_HOME:\$M2_HOME:\$M2" >> .bash_profile
echo "export PATH" >> .bash_profile
source .bash_profile


