output "rds_endpoint" {
    value = "${aws_db_instance.mysql.address}"
}
