# Private subnet
resource "aws_subnet" "private" {
    vpc_id = "${aws_vpc.default.id}"
    cidr_block = "${var.private_subnet_cidr}"
    availability_zone = "us-west-2a"
    map_public_ip_on_launch = false
    tags {
        Name = "private"
    }
}

# RDS private subnet 1
resource "aws_subnet" "rds1" {
    vpc_id = "${aws_vpc.default.id}"
    cidr_block = "10.10.20.0/24"
    availability_zone = "us-west-2b"
    map_public_ip_on_launch = false
    tags {
        Name = "rds1"
    }
}

# RDS private subnet 2
resource "aws_subnet" "rds2" {
    vpc_id = "${aws_vpc.default.id}"
    cidr_block = "10.10.30.0/24"
    availability_zone = "us-west-2c"
    map_public_ip_on_launch = false
    tags {
        Name = "rds2"
    }
}

# Routing table
resource "aws_route_table" "private" {
    vpc_id = "${aws_vpc.default.id}"
    route {
        cidr_block = "0.0.0.0/0"
        # nat_gateway_id = "${aws_nat_gateway.nat.id}" # Use with nat-gateway.tf.optional
        instance_id = "${aws_instance.nat.id}"
    }
}

# Routing table association
resource "aws_route_table_association" "private" {
    subnet_id = "${aws_subnet.private.id}"
    route_table_id = "${aws_route_table.private.id}"
}

resource "aws_route_table_association" "rds1" {
    subnet_id = "${aws_subnet.rds1.id}"
    route_table_id = "${aws_route_table.private.id}"
}

resource "aws_route_table_association" "rds2" {
    subnet_id = "${aws_subnet.rds2.id}"
    route_table_id = "${aws_route_table.private.id}"
}
