variable "region" {
    description = "AWS region"
    default = "us-west-2"
}

variable "ubuntu-ami" {
    description = "Ubuntu 14.04 AMI for us-west-2"
    default = "ami-d732f0b7"
}

variable "nat-ami" {
    description = "Amazon Linux AMI VPC NAT x86_64 HVM GP2"
    default = "ami-69ae8259"
}
