# Staging server
resource "aws_instance" "web-staging" {
    ami = "${var.ubuntu-ami}"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.default.id}"
    security_groups = ["${aws_security_group.web_staging.id}"]
    key_name = "${aws_key_pair.wordpress.key_name}"
    tags = {
        Name = "wordpress-web-staging"
    }
}
