# Salt master
resource "aws_instance" "master" {
    ami = "${var.centos-ami}"
    instance_type = "t2.micro"
    subnet_id = "pass"
    vpc_security_group_ids = ["${aws_security_group.salt_master.id}"]
    key_name = "pass"
    tags = {
        Name = "salt-master"
        salt = "master"
    }
}
