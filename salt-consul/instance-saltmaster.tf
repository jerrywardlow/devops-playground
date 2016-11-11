# Salt master
resource "aws_instance" "master" {
    ami = "${var.centos-ami}"
    isntance_type = "t2.micro"
    subnet_id = "pass"
    vpc_security_group_ids = ["pass"]
    key_name = "pass"
    tags = {
        Name = "salt-master"
        salt = "master"
    }
}
