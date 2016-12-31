# Staging server
resource "aws_instance" "web-staging" {
    ami = "${data.aws_ami.ubuntu.id}"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.public.id}"
    vpc_security_group_ids = ["${aws_security_group.web_staging.id}"]
    key_name = "${aws_key_pair.wordpress.key_name}"

    user_data = "${data.template_file.user_data.rendered}"

    tags = {
        Name = "wordpress-web-staging"
        group = "twc-ec2"
    }
}
