# Gateway for subnet
resource "aws_internet_gateway" "default" {
    vpc_id = "${aws_vpc.default.id}"
}

# Public subnet
resource "aws_subnet" "default" {
    vpc_id = "${aws_vpc.default.id}"
    cidr_block = "10.10.0.0/24"
    availability_zone = "us-west-2a"
    map_public_ip_on_launch = true
    depends_on = ["aws_internet_gateway.default"]
    tags {
        Name = "default"
    }
}

# Routing table for public subnet
resource "aws_route_table" "default" {
    vpc_id = "${aws_vpc.default.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.default.id}"
    }
    tags {
        Name = "default"
    }
}

resource "aws_route_table_association" "default" {
    subnet_id = "${aws_subnet.default.id}"
    route_table_id = "${aws_route_table.default.id}"
}
