# RDS instance
resource "aws_db_instance" "mysql" {
    instance_class = "db.t2.micro"
    allocated_storage = 5
    engine = "mysql"    
}
