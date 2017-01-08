provider "aws" {
    region = "us-west-2"
}

resource "aws_instance" "db" {
    ami = "ami-9ee24ffe"
    instance_type = "t2.micro"
    key_name = "jerry-executor"

    tags = {
        Name = "chef-test-db"
    }
}

resource "aws_instance" "app" {
    ami = "ami-9ee24ffe"
    instance_type = "t2.micro"
    key_name = "jerry-executor"

    tags = {
        Name = "chef-test-app"
    }
}
