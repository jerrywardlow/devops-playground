# Production web servers
resource "aws_instance" "web-production" {
    count = 3
    ami = "${var.ubuntu-ami}"
    instance_type = "t2.micro"
    subnet_id = "${element(aws_subnet.private.*.id, count.index)}"
    vpc_security_group_ids = ["${aws_security_group.web_production.id}"]
    key_name = "${aws_key_pair.wordpress.key_name}"
    tags = {
        Name = "wordpress-web-production-${count.index}"
        group = "production"
    }
}
