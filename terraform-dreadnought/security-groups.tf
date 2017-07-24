# NAT instance security group
resource "aws_security_group" "dreadnought" {
    name = "dreadnought"
    description = "Security group for "
    vpc_id = "${aws_vpc.default.id}"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 443
        to_port = 443
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
        Name = "dreadnought"
        group = "dreadnought-sg"
    }
}

resource "aws_security_group" "internal" {
	name = "internal"
    description = "All ports open for cross group traffic"
    vpc_id = "${aws_vpc.default.id}"

	ingress {
		from_port = 0
		to_port = 0
		protocol = -1
		security_groups = ["${aws_security_group.dreadnought.id}"]
    }

    tags {
        Name = "internal"
        group = "dreadnought-sg"
    }
}
