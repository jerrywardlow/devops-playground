variable "rhel-ami" {
    description = "RHEL AMI"
    default = "ami-b55a51cc" # Red Hat Enterprise Linux 7.3 (HVM)
}

variable "ubuntu-ami" {
    description = "Ubuntu AMI"
    default = "ami-835b4efa" # Ubuntu 16.04 (HVM)
}

variable "web-instance-type" {
    description = "EC2 instance type for web servers"
    default = "t2.micro"
}

variable "db-instance-type" {
    description = "EC2 instance type for database servers"
    default = "t2.micro"
}

variable "lb-instance-type" {
    description = "EC2 instance type for load balancers" 
    default = "t2.micro"
}

variable "log-instance-type" {
    description = "EC2 instance type for logging server" 
    default = "t2.micro"
}
