# Pull availability zones
data "aws_availability_zones" "available" {}

# Private subnet
resource "aws_subnet" "private" {
    count = 3
    vpc_id = "${aws_vpc.default.id}"
    cidr_block = "${var.private_subnet_cidr[count.index]}"
    availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
    map_public_ip_on_launch = false
    tags {
        Name = "private-${count.index}"
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
    count = 3
    subnet_id = "${element(aws_subnet.private.*.id, count.index)}"
    route_table_id = "${aws_route_table.private.id}"
}
