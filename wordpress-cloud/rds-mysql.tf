# RDS instance
resource "aws_db_instance" "mysql" {
    identifier = "wordpress-mysql"
    instance_class = "db.t2.micro"
    allocated_storage = 5
    storage_type = "gp2"
    engine = "mysql"

    name = "wordpressdb"
    username = "dbuser"
    password = "dbpassword"

    vpc_security_group_ids = ["${aws_security_group.mysql.id}"]
}
