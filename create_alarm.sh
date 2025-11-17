#!/bin/bash
# TOPIC_ARN="arn:aws:sns:region:account-id:JenkinsAlertTopic"
# TOPIC_ARN="arn:aws:sns:ap-south-1:650251693774:JenkinsAlertTopic:461f922e-0239-4029-b909-637ab38c741a"
aws cloudwatch put-metric-alarm \
    --alarm-name "JenkinsDownAlarm" \
    --metric-name JenkinsStatus \
    --namespace "Jenkins" \
    --statistic Average \
    --period 60 \
    --threshold 0 \
    --comparison-operator LessThanOrEqualToThreshold \
    --evaluation-periods 1 \
    --alarm-actions $TOPIC_ARN