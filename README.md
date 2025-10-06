**Project : This is Terraform Practice project for creation of AWS Ec2 instance having Remote backend at S3 Bucket and state lock id in Dynamo table in AWS**

1. Creation of AWS instance
2. setup S3 backend having statefile stored within S3 bucket
3. State lock id in dynamo table so that there will be no concurrent IAC terraform execution happen.
4. Datasource AMI to fetch the latest ubuntu AMI images for EC2 instance.
