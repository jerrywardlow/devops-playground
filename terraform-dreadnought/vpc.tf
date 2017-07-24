provider "aws" {
    region = "us-west-2"
}

resource "aws_vpc" "dreadnought" {
    cidr_block = "10.123.0.0/16"
    enable_dns_hostnames = true
    tags {
        Name = "dreadnought"
        group = "dreadnought-vpc"
    }
}
