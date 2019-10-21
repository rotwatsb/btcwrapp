#!/bin/bash

# example: ./create-ecs-service.sh vpc-08ffd7a6c352ce4e2 bastion_ip_address subnet-031b1693d2cb918bb\,subnet-005defdbc1fe294b6 subnet-0840d739f171981fd\,subnet-0ec2ef819fe4732e6 ns-jmrijhmtq4f4wx7a peanuts-vpc-stack-peanutsECSCluster-12S71HZK81LSL peanutsECSLogGroup-peanuts-vpc-stack

aws cloudformation create-stack --capabilities CAPABILITY_IAM --stack-name=btcwrapp-ecs-stack --template-body file://cloudformation/btcwrapp.json --parameters ParameterKey=VpcId,ParameterValue=$1 ParameterKey=AllowedSSHCidr,ParameterValue=$2/32 ParameterKey=PublicSubnetIds,ParameterValue=\"$3\" ParameterKey=PrivateSubnetIds,ParameterValue=\"$4\" ParameterKey=PrivateDnsNamespaceId,ParameterValue=$5 ParameterKey=ECSClusterName,ParameterValue=$6 ParameterKey=CloudwatchLogsGroupName,ParameterValue=$7

STACK_STATUS="\"CREATE_IN_PROGRESS\""
while [[ "$STACK_STATUS" == "\"CREATE_IN_PROGRESS\"" ]]
do
    echo "Stack status: $STACK_STATUS"
    sleep 10
    STACK_STATUS=$(aws cloudformation describe-stacks --stack-name=btcwrapp-ecs-stack | jq '.["Stacks"][0]["StackStatus"]')
done

if [ "$STACK_STATUS" == "\"CREATE_COMPLETE\"" ]; then
   aws cloudformation describe-stacks --stack-name=peanuts-vpc-stack | jq '.["Stacks"][0]["Outputs"]'
fi

