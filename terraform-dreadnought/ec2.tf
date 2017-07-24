# Web servers

resource "aws_instance" "web" {
    count = 2
    ami = "${var.ubuntu-ami}"
    instance_type = "${var.web-instance-type}"
    subnet_id = "${aws_subnet.public.id}"
    vpc_security_group_ids = ["${aws_security_group.dreadnought.id}", "${aws_security_group.internal.id}"]
    key_name = "${aws_key_pair.dreadnought.key_name}"

    user_data = "${data.template_file.user_data.rendered}"

    tags = {
        Name = "web${count.index}"
        group = "dreadnought-ec2"
    }
}

# Database server

resource "aws_instance" "db" {
    ami = "${var.ubuntu-ami}"
    instance_type = "${var.db-instance-type}"
    subnet_id = "${aws_subnet.public.id}"
    vpc_security_group_ids = ["${aws_security_group.dreadnought.id}", "${aws_security_group.internal.id}"]
    key_name = "${aws_key_pair.dreadnought.key_name}"

    user_data = "${data.template_file.user_data.rendered}"

    tags = {
        Name = "db"
        group = "dreadnought-ec2"
    }
}

# Load balancer

resource "aws_instance" "lb" {
    ami = "${var.ubuntu-ami}"
    instance_type = "${var.lb-instance-type}"
    subnet_id = "${aws_subnet.public.id}"
    vpc_security_group_ids = ["${aws_security_group.dreadnought.id}", "${aws_security_group.internal.id}"]
    key_name = "${aws_key_pair.dreadnought.key_name}"

    user_data = "${data.template_file.user_data.rendered}"

    tags = {
        Name = "lb"
        group = "dreadnought-ec2"
    }
}

# Logging server

resource "aws_instance" "log" {
    ami = "${var.rhel-ami}"
    instance_type = "${var.log-instance-type}"
    subnet_id = "${aws_subnet.public.id}"
    vpc_security_group_ids = ["${aws_security_group.dreadnought.id}", "${aws_security_group.internal.id}"]
    key_name = "${aws_key_pair.dreadnought.key_name}"

    user_data = "${data.template_file.user_data.rendered}"

    tags = {
        Name = "log"
        group = "dreadnought-ec2"
    }
}
