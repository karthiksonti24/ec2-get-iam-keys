#!/bin/bash

#Fetches the role name attached to the instance
roleName=$(curl -s  http://169.254.169.254/latest/meta-data/iam/security-credentials)


if [[ "$roleName" =~ .*"Not Found".* ]]; 
then
  echo "This instace is not having a role attached,please attach one!!!"
else
  #Fetches credentials from metadata
  curl -o iam-credentials.json http://169.254.169.254/latest/meta-data/iam/security-credentials/$roleName
fi


if [[  $(cat iam-credentials.json | jq -r '.Code') == "Success" ]]
then 
    aws configure set aws_access_key_id $(cat iam-credentials.json | jq -r '.AccessKeyId') 
    aws configure set aws_secret_access_key $(cat iam-credentials.json | jq -r '.SecretAccessKey') 
else
    echo $(cat iam-credentials.json | jq -r '.Message')
fi

rm iam-credentials.json
