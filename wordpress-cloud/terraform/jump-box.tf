# SSH/Ansible jump box
resource "aws_instance" "jump-box" {
    ami = "${var.jump-ami}"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.public.id}"
    vpc_security_group_ids = ["${aws_security_group.jump.id}"]
    key_name = "${aws_key_pair.wordpress.key_name}"
    tags = {
        name = "jump-box"
    }
}
