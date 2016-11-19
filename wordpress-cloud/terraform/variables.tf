data "aws_ami" "ubuntu" {
    most_recent = true
    filter {
        name = "name"
        values = ["wordpress-*"]
    }
    owners = ["self"]
}

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

variable "bastion-ami" {
    description = "AMI for SSH bastion"
    default = "ami-d732f0b7"
}

variable "public_subnet_cidr" {
    description = "CIDR block for public subnet"
    default = "10.10.0.0/24"
}

variable "private_subnet_cidr" {
    description = "CIDR blocks for private subnets"
    default = [
        "10.10.10.0/24",
        "10.10.20.0/24",
        "10.10.30.0/24"
    ]
}
