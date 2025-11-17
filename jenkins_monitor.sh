#! /bin/bash
LOG_FILE="/var/log/jenkins_monitor.log"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
STATUS=$(sudo systemctl is-active jenkins)

if [ "$STATUS" == "active" ]; then
    echo "$TIMESTAMP - Jenkins in UP" >> $LOG_FILE
    aws cloudwatch put-metric-data --metric-name JenkinsStatus --namespace "Jenkins" --value 1
else
    echo "$TIMESTAMP = Jenkins in DOWN" >> $LOG_FILE
    aws cloudwatch put-metric-data --metric-name JenkinsStatus --namespace "Jenkins" --value 0
fi

# schedule with cron
# sudo crontab -e
# write inside file
#  */5 * * * * /bin/bash /jenkins_monitor.sh
# esc, :wq, enter

# to check cronjob
# sudo crontab -l