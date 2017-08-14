data "aws_ami" "ubuntu" {
    most_recent = true
    filter {
        name = "name"
        values = ["wordpress-*"]
    }
    owners = ["self"]
}

# Pull availability zones
data "aws_availability_zones" "available" {}

variable "region" {
    description = "AWS region"
    default = "us-west-2"
}

data "aws_ami" "nat" {
    most_recent = true
    filter {
        name = "name"
        values = ["amzn-ami-vpc-nat-hvm*"]
    }
    owners = ["amazon"]
}

data "aws_ami" "bastion" {
    most_recent = true
    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server*"]
    }
    owners = ["099720109477"]
}

variable "bastion-ami" {
    description = "AMI for SSH bastion"
    default = "ami-d732f0b7"
}

variable "public_subnet_cidr" {
    description = "CIDR block for public subnet"
    default = "10.5.0.0/24"
}

variable "private_subnet_cidr" {
    description = "CIDR blocks for private subnets"
    default = [
        "10.10.10.0/24",
        "10.10.20.0/24",
        "10.10.30.0/24"
    ]
}
