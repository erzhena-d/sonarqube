data "aws_ami" "sonarqube" {
  most_recent = true
  owners = ["self"] # fetch data from aws

#   filter {
#     name   = "tag:Name"
#     values = ["my-sonarqube-group2-*"]
#   }
}

# resource "aws_key_pair" "deployer" {
#   key_name   = "ubuntu-key"
#   public_key = file("~/.ssh/id_rsa.pub")
# }

resource "aws_instance" "web" {
  ami                    = data.aws_ami.sonarqube.id #here packer will provide the AMI ID for the created image
  key_name               = "ubuntu-key"
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
}

