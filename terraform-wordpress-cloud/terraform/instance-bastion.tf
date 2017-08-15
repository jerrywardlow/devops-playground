# SSH/Ansible bastion host
resource "aws_instance" "bastion" {
    ami = "${data.aws_ami.bastion.id}"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.public.id}"
    vpc_security_group_ids = ["${aws_security_group.bastion.id}"]
    key_name = "${aws_key_pair.wordpress.key_name}"
    tags = {
        Name = "bastion"
        resource_group = "twc-ec2"
        group = "ec2-bastion"
    }
}
