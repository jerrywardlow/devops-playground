# Load balancer security group
resource "aws_security_group" "elb" {
    name = "wordpress-elb"
    description = "Security group for all traffic on port 80"
    vpc_id = "${aws_vpc.default.id}"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags {
        Name = "wordpress-elb"
    }
}


# Web staging secuity group
resource "aws_security_group" "web_staging" {
    name = "wordpress-web-staging"
    description = "Security group allowing ports 80 and 22 inbound"
    vpc_id = "${aws_vpc.default.id}"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"] # Eventually limit this
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags {
        Name = "wordpress-web-staging"
    }
}
