#!/bin/bash

read -p "Enter email: " EMAIL

export TOPIC_ARN=$(aws sns create-topic --name JenkinsAlertTopic --query 'TopicArn' --output text)
aws sns subscribe --topic-arn $TOPIC_ARN --protocol email --notification-endpoint $EMAIL
echo "SNS Topic created: $TOPIC_ARN"
echo "Check your email to confirm subscription."

# test sns initially
# aws sns publish \
#   --topic-arn arn:aws:sns:ap-south-1:650251693774:JenkinsAlertTopic \
#   --message "Test message from SNS"


