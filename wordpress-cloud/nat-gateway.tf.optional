# Elastic IP for NAT Gateway
resource "aws_eip" "nat" {
    vpc = true
}

# NAT Gateway for private subnet
resource "aws_nat_gateway" "nat" {
    allocation_id = "${aws_eip.nat.id}"
    subnet_id = "${aws_subnet.public.id}"
    depends_on = ["aws_internet_gateway.default"]
}
