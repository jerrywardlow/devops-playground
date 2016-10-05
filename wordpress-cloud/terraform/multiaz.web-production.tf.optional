# Production web servers
resource "aws_instance" "web-production-a" {
    ami = "${var.ubuntu-ami}"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.private.id}"
    security_groups = ["${aws_security_group.web_production.id}"]
    key_name = "${aws_key_pair.wordpress.key_name}"
    tags = {
        Name = "wordpress-web-production-a}"
    }
}

resource "aws_instance" "web-production-b" {
    ami = "${var.ubuntu-ami}"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.rds1.id}"
    security_groups = ["${aws_security_group.web_production.id}"]
    key_name = "${aws_key_pair.wordpress.key_name}"
    tags = {
        Name = "wordpress-web-production-b"
    }
}

resource "aws_instance" "web-production-c" {
    ami = "${var.ubuntu-ami}"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.rds2.id}"
    security_groups = ["${aws_security_group.web_production.id}"]
    key_name = "${aws_key_pair.wordpress.key_name}"
    tags = {
        Name = "wordpress-web-production-c"
    }
}
