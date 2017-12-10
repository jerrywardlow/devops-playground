/* Skipping these for git reasons and using environment variables

variable "access_key" {
    description = "AWS access key"
}

variable "secret_key" {
    description = "AWS secret access key"
}
*/

variable "region" {
    description = "AWS region"
    default     = "us-west-2"
}

variable "vpc_cidr" {
    description = "/16 CIDR for VPC"
    default     = "10.128.0.0/16"
}

variable "public_subnet_cidr" {
    description = "CIDR for public subnet"
    default     = "10.128.0.0/24"
}

variable "private_subnet_cidr" {
    description = "CIDR for private subnet"
    default     = "10.128.1.0/24"
}

variable "amis" {
    description = "Ubuntu base AMI by region"
    default = {
        us-east-1 = "ami-81365496"
        us-west-1 = "ami-05105d65"
        us-west-2 = "ami-9ece19fe"
    }
}
