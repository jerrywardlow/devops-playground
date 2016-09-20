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

# NAT instance security group
resource "aws_security_group" "nat" {
    name = "wordpress-nat"
    description = "Security group for NAT instance"
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
        cidr_blocks = ["${var.private_subnet_cidr}"] # Private subnet CIDR
    }

    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["${var.private_subnet_cidr}"] # Private subnet CIDR
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags {
        Name = "wordpress-nat"
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

# Web production security group
resource "aws_security_group" "web_production" {
    name = "wordpress-web-production"
    description = "Security group allowing port 80 from ELB"
    vpc_id = "${aws_vpc.default.id}"

    ingress {
        from_port = 80
        to_port = 80
        protocol  = "tcp"
        security_groups = ["${aws_security_group.elb.id}"]
    }

    # Use NAT instance as SSH jump box:
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        security_groups = ["${aws_security_group.nat.id}"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        # security_groups = ["${aws_security_group.elb.id}", "${aws_security_group.nat.id}", "${aws_security_group.redis.id}", "${aws_security_group.mysql.id}"]
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags {
        Name = "wordpress-web-production"
    }
}

# Redis security group
resource "aws_security_group" "redis" {
    name = "wordpress-redis"
    description = "Security group allowing port 6379 from web_staging and web_production"
    vpc_id = "${aws_vpc.default.id}"

    ingress {
        from_port = 6379
        to_port = 6379
        protocol = "tcp"
        security_groups = ["${aws_security_group.web_staging.id}", "${aws_security_group.web_production.id}"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags {
        Name = "wordpress-redis"
    }
}

# MySQL security group
resource "aws_security_group" "mysql" {
    name = "wordpress-mysql"
    description = "Security group allowing port 3306 from web_staging and web_production"
    vpc_id = "${aws_vpc.default.id}"

    ingress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        security_groups = ["${aws_security_group.web_staging.id}", "${aws_security_group.web_production.id}"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags {
        Name = "wordpress-mysql"
    }
}
