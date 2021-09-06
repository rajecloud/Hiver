####### Python code to list all the instances with instance type as m5.large in us-east-1 region ##########


#!/usr/bin/env python3

import boto3

AWS_REGION = "us-east-1"
EC2_RESOURCE = boto3.resource('ec2', region_name=AWS_REGION)
INSTANCE_TYPE = 'm5.large'

instances = EC2_RESOURCE.instances.filter(
    Filters=[
        {
            'Name': 'instance-type',
            'Values': [
                INSTANCE_TYPE
            ]
        }
    ]
)


for instance in instances:
    print(f'Name:     Instance ID: \n{instance.name}     {instance.id}')