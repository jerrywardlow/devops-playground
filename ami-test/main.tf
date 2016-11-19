data "aws_ami" "web" {
    most_recent = true
    filter {
        name = "name"
        values = ["packer-ami-*"]
    }
    owners = ["self"]
}

provider "aws" {
    region = "us-west-2"
}

resource "aws_instance" "test" {
    ami = "${data.aws_ami.web.id}"
    instance_type = "t2.micro"
}
