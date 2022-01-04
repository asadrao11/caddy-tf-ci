# variables.tf
variable "access_key" {
   default = ""
}
variable "secret_key" {
   default = ""
}
variable "region" {
   default = "ap-south-1"
}
variable "availabilityZone" {
   default = "ap-south-1a"
}
variable "instanceType" {
   default = "t2.micro"
}
variable "keyName" {
   default = "yayhost-test"
}
variable "keyPath" {
   default = "./app.pem"
}

variable "securityGroups" {
   type = list
   default = [ "sg-570bf63d" ]
}
variable "instanceName" {
   default = "Go-Caddy-App"
}
# ami-052cef05d01020f1d is the free Amazon Linux 2 AMI
# for the ap-south-1 region. Amazon Linux 2
# is a downstream version of Red Hat Enterprise Linux /
# Fedora / CentOS. It is analogous to RHEL 7.
variable "amis" {
   default = {
     "ap-south-1" = "ami-052cef05d01020f1d"
   }
}
# end of variables.tf