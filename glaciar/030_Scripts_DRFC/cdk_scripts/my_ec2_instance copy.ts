import * as cdk from 'aws-cdk-lib/core';
import * as iam from 'aws-cdk-lib/aws-iam';
import { Tags, Fn } from 'aws-cdk-lib';
import { AmazonLinuxCpuType, MachineImage, UserData } from 'aws-cdk-lib/aws-ec2';
import * as autoscaling from 'aws-cdk-lib/aws-autoscaling';
import * as ec2 from 'aws-cdk-lib/aws-ec2';
import { Construct } from 'constructs';


const userData = UserData.forLinux();
userData.addCommands(
   // Your command list here...
);


const role = new iam.Role(this, 'InstanceRole', {
    assumedBy: new iam.CompositePrincipal(
        new iam.ServicePrincipal('ec2.amazonaws.com'), 
        new iam.ServicePrincipal('ssm.amazonaws.com'))
});
role.addManagedPolicy(iam.ManagedPolicy.fromAwsManagedPolicyName('AmazonSSMManagedEC2InstanceDefaultPolicy'));



const ssmSecurityGroup = new ec2.SecurityGroup(this, 'SSMSecurityGroup', {
    vpc: ipv6Vpc, // Make sure to define the VPC
    allowAllIpv6Outbound: true
});


const launchTemplate = new ec2.LaunchTemplate(this, 'LaunchTemplate', {
    // Configuration parameters
    //...
    role: role,
    securityGroup: ssmSecurityGroup,
    userData: userData,
});


export class Ec2Stack extends cdk.Stack {
    // The constructor and above code here...
}



