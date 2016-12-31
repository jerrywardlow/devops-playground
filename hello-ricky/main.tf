provider "aws" {
    region = "us-west-2"
}

resource "aws_security_group" "main" {
    name = "instance"
    description = "Insecure security group for hello-ricky"
    
    ingress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags {
        Name = "instance"
        group = "hello-ricky"
    }
}

resource "aws_instance" "web" {
    ami = "ami-b7a114d7"
    instance_type = "t2.micro"
    vpc_security_group_ids = ["${aws_security_group.main.id}"]
    key_name = "jerry-executor"

    tags = {
        Name = "web"
        group = "hello-ricky"
    }
}

resource "aws_instance" "db" {
    ami = "ami-b7a114d7"
    instance_type = "t2.micro"
    vpc_security_group_ids = ["${aws_security_group.main.id}"]
    key_name = "jerry-executor"

    tags = {
        Name = "db"
        group = "hello-ricky"
    }
}
