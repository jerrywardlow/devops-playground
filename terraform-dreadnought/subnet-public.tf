# Gateway for public subnet
resource "aws_internet_gateway" "default" {
    vpc_id = "${aws_vpc.dreadnought.id}"
}

# Public subnet
resource "aws_subnet" "public" {
    vpc_id = "${aws_vpc.dreadnought.id}"
    cidr_block = "10.123.0.0/24"
    availability_zone = "us-west-2a"
    map_public_ip_on_launch = true
    depends_on = ["aws_internet_gateway.default"]
    tags {
        Name = "public"
        group = "dreadnought-subnet"
    }
}

# Routing table
resource "aws_route_table" "public" {
    vpc_id = "${aws_vpc.dreadnought.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.default.id}"
    }
}

# Associate routing table
resource "aws_route_table_association" "public" {
    subnet_id = "${aws_subnet.public.id}"
    route_table_id = "${aws_route_table.public.id}"
}
