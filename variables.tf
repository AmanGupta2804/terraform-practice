variable "aws_region" {
  description = "this is the  region specified for AWS resources "
  type        = string
  default     = "eu-west-1"
}

variable "instance_type" {
  description = "this is the instance type for ec2 instance"
  type        = string
  default     = "t2.micro"
}

# variable "ami_id" {
#   description = "this is the AMI ID for ec2 instance"
#   type        = string
#   default     = "ami-0bc691261a82b32bc"
# }

variable "instance_name" {
  description = "this is the name of the instance"
  type        = string
  default     = "Aman-practice-instance"
}
variable "root_block_device" {
    description = "this is the root block device configuration"
    
    default     = "10"        

  
}

variable "aws_instance_count" {
  description = "this is the number of Ec2 needed"
  default =3
}