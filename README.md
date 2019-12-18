# thoughtworks

This repo contains the code to Provision an AWS infrastructure which creates ec2 instances, autoscaling group and a database instance.
It also consists of network configuration on the aws environment.

The code is written in Terraform Hashi corp language.

#Code Execution.

To run the terraform code, I have created a Jenkins file using groovy script which has following stages in it:--

1. Terraform initalization
2. Terraform Plan
3. Terraform Apply
4. Terraform Destroy.

As soon as we start the Jenkins job it will ask to put in the value of environment variable, based on that value it create a workspace and also choose the tfvars file in accordance with environment chosen.
Once the Terraform run successfully, it ask for what we action we need to perform:- Apply/Destroy.

Terraform Apply creates the environment with all the resources defined.
Terraform Destroy , destroys the existing environment.


Also the terraform state file is stored in s3 bucket and dynamo db(name of which are mentioned in the files in repo).


##NOTE:-- The values of AMI name/ Key name/ ZONEID/ Network related values are all dummy values, these values will depend on the aws account where anyone wants to create the environment 

Assumption:--
I have assumed the application to be deployed is a Java application, so the user data for ec2 instance is created according to that , however if anyone want to create application in other language we will have to modify the user data file accordingly.


