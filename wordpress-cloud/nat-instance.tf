# Elastic IP for NAT instance
resource "aws_eip" "nat" {
    vpc = true
}

# NAT Instance
resource "aws_instance" "nat" {
    ami = "${var.nat-ami}"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.public.id}"
    security_groups = ["${aws_security_group.nat.id}"]
    key_name = "${aws_key_pair.wordpress.key_name}"
    tags = {
        Name = "wordpress-nat"
    }
}
