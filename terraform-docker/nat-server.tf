# NAT/VPN server
resource "aws_instance" "nat" {
    ami = "${lookup(var.amis, var.region)}"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.public.id}"
    security_groups = ["${aws_security_group.default.id}", "${aws_security_group.nat.id}"]
    key_name = "${aws_key_pair.deployer.key_name}"
    source_dest_check = false
    tags = {
        Names = "nat"
    }
    connection {
        user = "ubuntu"
        key_file = "ssh/insecure-deployer"
    }
    provisioner "remote-exec" {
        inline = [
            "echo 'Hello World!'"
        ]
    }
}
