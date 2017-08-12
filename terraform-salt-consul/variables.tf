variable "region" {
    description = "AWS region"
    default = "us-west-2"
}

data "aws_ami" "centos-ami" {
    most_recent = true
    filter {
        name = "name"
        values = ["CentOS Linux 7 x86_64 HVM EBS*"]
    }
    owners = ["679593333241"]
}
