# Private subnet
resource "aws_subnet" "private" {
    vpc_id = "${aws_vpc.default.id}"
    cidr_block = "10.10.9.0/24"
    availability_zone = "us-west-2a"
    map_public_ip_on_launch = false
    tags {
        Name = "private"
    }
}

# Routing table
resource "aws_route_table" "private" {
    vpc_id = "${aws_vpc.default.id}"
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = ""
    }
}

# Routing table association
resource "aws_route_table_association" "private" {
    subnet_id = "${aws_subnet.public.id}"
    route_table_id = "${aws_route_table.private.id}"
}
