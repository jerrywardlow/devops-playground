# Default security group
resource "aws_security_group" "default" {
    name = "default-airpair-example"
    description = "Default security group allowing in and outbound traffic from all instances in VPC"
    vpc_id = "${aws_vpc.default.id}"

    ingress {
        from_port = "0"
        to_port = "0"
        protocol = "-1"
        self = true
    }

    egress {
        from_port = "0"
        to_port = "0"
        protocol = "-1"
        self = true
    }

    tags {
        Name = "airpair-example-default-vpc"
    }
}

# Security group for NAT server
resource "aws_security_group" "nat" {
    name = "nat-airpair-example"
    description = "Security group for NAT instances allowing SSH, VPN and outbound HTTP"
    vpc_id = "${aws_vpc.default.id}"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 1194
        to_port = 1194
        protocol = "udp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags {
        Name = "nat-airpair-example"
    }
}

# Security group for web
resource "aws_security_group" "web" {
    name = "web-airpair-example"
    description = "Security group allowing web traffic"
    vpc_id = "${aws_vpc.default.id}"

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

    tags {
        Name = "web-airpair-example"
    }
}
