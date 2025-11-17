#!/bin/bash

#install jenkins and cron
chmod +x install_jenkins.sh
./install_jenkins.sh

echo "A"

# configure aws
chmod +x configure_aws.sh
./configure_aws.sh
echo "B"

# setup_sns
chmod +x setup_sns.sh
source setup_sns.sh
aws sns publish --topic-arn $TOPIC_ARN --message "Test Jenkins Alert"
echo "C"

# create alarm
chmod +x create_alarm.sh
./create_alarm.sh
echo "D"

# create jenkins_monitor.log file
sudo touch /var/log/jenkins_monitor.log
sudo chmod 644 /var/log/jenkins_monitor.log
echo "E"


# execute jenkins_monitor.sh
chmod +x jenkins_monitor.sh
./jenkins_monitor.sh
echo "F"

read -p "Tell me the job schedule: " JOB_SCHEDULE
# * * * * *

read -p "Tell me the bash: " BASH
# /bin/bash

read -p "Tell me the file path: " FILE_PATH 
# /jenkins_monitor.sh

# Add cron job to run every 5 minutes
( sudo crontab -l 2>/dev/null; echo "$JOB_SCHEDULE $BASH $FILE_PATH" ) | sudo crontab - 
echo "Cron job added successfully!"
echo "G"

# */5 * * * * /bin/bash /home/ec2-user/jenkins_monitor.sh

# to check cron
sudo crontab -l

# install_jenkins.sh --> configure_aws.sh  --> setup_sns.sh  --> create_alarm.sh --> jenkins_monitor.sh
