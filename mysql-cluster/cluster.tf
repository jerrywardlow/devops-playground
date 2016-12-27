provider "aws" {
    region = "us-west-2"
}

# Master
resource "aws_instance" "management-server" {
    ami = "ami-b7a114d7"
    instance_type = "t2.micro"
    key_name = "jerry-executor"

    tags = {
        Name = "manager.mysql.cluster"
    }
}

resource "aws_instance" "node" {
    count = 2
    ami = "ami-b7a114d7"
    instance_type = "t2.micro"
    key_name = "jerry-executor"

    tags = {
        Name = "node${count.index}.mysql.cluster"
    }
}
