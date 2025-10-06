terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.14.1"
    }
  }
  backend "s3" {
    bucket         = "aman-practice-bucket"
    key            = "\terraform-for-devops\terraform-practice\terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "aman-practice-lock-table"
    encrypt        = true
  }
}


provider "aws" {
 region = var.aws_region
}