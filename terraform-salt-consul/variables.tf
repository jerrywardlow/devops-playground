variable "region" {
    description = "AWS region"
    default = "us-west-2"
}

variable "centos-ami" {
    description = "CentOS 7 x64 v1602 AMI for us-west-2"
    default = "ami-d2c924b2"
}

data "aws_ami" "centos-ami" {
    most_recent = true
    filter {
        name = "name"
        values = ["CentOS Linux 7 x86_64 HVM EBS*"]
    }
    owners = ["679593333241"]
}
