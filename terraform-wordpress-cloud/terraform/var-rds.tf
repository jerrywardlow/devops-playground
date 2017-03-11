# RDS Variables
variable "rds-identifier" {
    description = "Identifier for RDS"
    default = "wordpress-mysql"
}

variable "rds-instance-class" {
    description = "Instance class for RDS"
    default = "db.t2.micro"
}

variable "rds-allocated-storage" {
    description = "Allocated storage for RDS"
    default = 5
}

variable "rds-multi-az" {
    description = "Multi-AZ selection for RDS"
    default = false
}

variable "rds-db-name" {
    description = "Database name for RDS"
    default = "wordpressdb"
}

variable "rds-db-username" {
    description = "User name for RDS"
    default = "dbuser"
}

variable "rds-db-password" {
    description = "Password for RDS"
    default = "dbpassword"
}
