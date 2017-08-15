# Elastic IP for NAT instance
resource "aws_eip" "nat" {
    vpc = true
}

# NAT Instance
resource "aws_instance" "nat" {
    ami = "${data.aws_ami.nat.id}"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.public.id}"
    vpc_security_group_ids = ["${aws_security_group.nat.id}"]
    source_dest_check = false
    key_name = "${aws_key_pair.wordpress.key_name}"
    tags = {
        Name = "wordpress-nat"
        resource_group = "twc-ec2"
        group = "ec2-nat"
    }
}

# Associate EIP with NAT
resource "aws_eip_association" "eip_assoc" {
    instance_id = "${aws_instance.nat.id}"
    allocation_id = "${aws_eip.nat.id}"
}
