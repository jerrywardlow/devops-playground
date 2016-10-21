# Production web servers
resource "aws_instance" "web-production" {
    count = 2
    ami = "${var.ubuntu-ami}"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.private.id}"
    vpc_security_group_ids = ["${aws_security_group.web_production.id}"]
    key_name = "${aws_key_pair.wordpress.key_name}"
    tags = {
        name = "wordpress-web-production-${count.index}"
        group = "production"
    }
}
