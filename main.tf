# create a Linux instance in AWS
# execute bash script to set up docker and run caddy container
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"

    }
  }

  required_version = ">= 0.14.9"
}
provider "aws" {
#        access_key = var.access_key
#        secret_key = var.secret_key
        region     = var.region
}
# create an instance
resource "aws_instance" "linux_instance" {
  ami             = lookup(var.amis, var.region)
#  subnet_id       = var.subnet
  vpc_security_group_ids = var.securityGroups
  key_name        = var.keyName
  instance_type   = var.instanceType

  # Let's create and attach an ebs volume
  # when we create the instance
  ebs_block_device {
    device_name = "/dev/xvdb"
    volume_type = "gp2"
    volume_size = 8
  }
  # Name the instance
  tags = {
    Name = var.instanceName
  }
  # Name the volumes; will name all volumes included in the
  # ami and the ebs block device from above with this instance.
  volume_tags = {
    Name = var.instanceName
  }
  

} # end resource