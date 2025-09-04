variable "region" {
  type        = string
  description = "AWS region to deploy resources in"
}
 variable "vpc_cidr" {
  type        = string
  description = "Provide vpc cidr block"
}

variable "subnet1_cidr" {
  type        = string
  description = "Provide subnet1 cidr block"
}

variable "subnet2_cidr" {
  type        = string
  description = "Provide subnet2 cidr block"
}

variable "subnet3_cidr" {
  type        = string
  description = "Provide subnet3 cidr block"
}

variable "ip_on_launch" {
  type = bool
}

variable "instance_type" {
  type = string
}

variable "ami_id" {
  type        = string
  description = "The AMI ID to use for the EC2 instance"
}

variable "environment" {
  type        = string
  description = "The environment for the deployment (e.g., dev, prod)"
}