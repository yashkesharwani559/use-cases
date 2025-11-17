
#!/bin/bash

sudo yum update -y

#install java
sudo dnf install java-21-amazon-corretto -y

# add the jenkins repo
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade

# install jenkins
sudo yum install jenkins -y

# install and start crontab
sudo dnf install cronie -y
sudo systemctl enable crond
sudo systemctl start crond

# enable and start jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins

# check status
sudo systemctl status jenkins

# press :q

# get password for jenkins
sudo cat /var/lib/jenkins/secrets/initialAdminPassword



#commands to execute file
#  chmod +x install_jenkins.sh
#  ./install_jenkins.sh

