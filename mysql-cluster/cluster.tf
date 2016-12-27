# Provider
provider "aws" {
    region = "us-west-2"
}

# Security group
resource "aws_security_group" "cluster" {
    name = "mysql-cluster"
    description = "Wide open SG"
    
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
        Name = "mysql-cluster"
    }
}

# Master
resource "aws_instance" "management-server" {
    ami = "ami-b7a114d7"
    instance_type = "t2.micro"
    vpc_security_group_ids = ["${aws_security_group.cluster.id}"]
    key_name = "jerry-executor"

    tags = {
        Name = "manager.mysql.cluster"
    }
}

# Nodes
resource "aws_instance" "node" {
    count = 2
    ami = "ami-b7a114d7"
    instance_type = "t2.micro"
    vpc_security_group_ids = ["${aws_security_group.cluster.id}"]
    key_name = "jerry-executor"

    tags = {
        Name = "node${count.index}.mysql.cluster"
    }
}
