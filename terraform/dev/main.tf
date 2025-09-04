
provider aws {
    region = var.region
}

module vpc {
    source = "../vpc"
    vpc_cidr = var.vpc_cidr
    subnet1_cidr = var.subnet1_cidr
    subnet2_cidr = var.subnet2_cidr
    subnet3_cidr = var.subnet3_cidr
    ip_on_launch = var.ip_on_launch
    environment = "dev"
    region = var.region
}

module ec2 {
    source = "../ec2"
    ami_id = var.ami_id
    instance_type = var.instance_type
    subnet_id = module.vpc.subnet
    region = var.region
}

