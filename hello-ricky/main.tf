provider "aws" {
    region = "us-west-2"
}

resource "aws_instance" "web" {
    ami = "ami-b7a114d7"
    instance_type = "t2.micro"
    vpc_security_group_ids = ["pass"]
    key_name = "pass"
}
