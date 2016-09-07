provider "aws" {
    region = "us-west-2"
}

resource "aws_vpc" "default" {
    cidr_block = "10.10.0.0/16"
    enable_dns_hostname = true
    tags {
        Name = "wordpress-cloud"
    }
}
