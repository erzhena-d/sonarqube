
// Configure the AWS Provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

// Call the VPC module to create a VPC and subnets
module "vpc" {
  source = "../vpc"

  environment = var.environment
  vpc_cidr    = var.vpc_cidr
  subnets     = var.subnets
}

// Call the EC2 module to create an EC2 instance in each subnet

module "ec2_web1" {
  source             = "../ec2"
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  environment        = var.environment
  subnet_id          = module.vpc.subnet1_id
  security_group_ids = module.vpc.security_group_ids
}













