
provider "aws" {
    region = var.region
}
terraform {
  backend "s3" {
    bucket = "sonar-bucket-erzhena"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

module vpc {
    source = "../vpc"
    vpc_cidr = var.vpc_cidr
    subnet1_cidr = var.subnet1_cidr
    subnet2_cidr = var.subnet2_cidr
    subnet3_cidr = var.subnet3_cidr
    ip_on_launch = var.ip_on_launch
    region = var.region
}

module ec2 {
    source = "../ec2"
    instance_type = var.instance_type
    subnet_id = module.vpc.subnet
    security_group_id = module.vpc.security_group_id
}

