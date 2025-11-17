
#!/bin/bash
sudo yum install aws-cli -y
# # If using keys:
# aws configure

read -p "AWS Access Key: " ACCESS_KEY
read -p "AWS Secret Key: " SECRET_KEY
read -p "Region: " REGION
read -p "Output Format: " OUTPUT_FORMAT

aws configure set aws_access_key_id $ACCESS_KEY
aws configure set aws_secret_access_key $SECRET_KEY
aws configure set region $REGION
aws configure set output $OUTPUT_FORMAT