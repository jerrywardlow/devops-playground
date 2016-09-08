# Private subnet
resource "aws_subnet" "private" {
    vpc_if = "${aws_vpc.default.id}"
    cidr_block = "10.10.9.0/24"
    avilability_zone = "us-west-2a"
    map_public_ip_on_launch = false
    tags {
        Name = "private"
    }
}
