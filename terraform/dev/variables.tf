
variable "environment" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "subnets" {
  type = list(object({
    name = string
    cidr = string
    az   = string
  }))
  description = "List of subnets with name, CIDR, and availability zone"
}

variable "instance_type" {
  type = string
}

variable "ami_id" {
  type = string
}
