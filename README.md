# EC2 Instance Metadata 

This script is used to get access key, secret key and session token from role attached to an instance.

## Prerequisites

Make sure you have AWS CLI and JQ package installed before. Steps for installation of AWS CLI can be found [here](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)

For Redhat/Centos distributon JQ can be installed using ```yum install jq``` and for Debian ```apt-get install jq ```.


### USAGE
```
./ec2-instance-metadata.sh 
```