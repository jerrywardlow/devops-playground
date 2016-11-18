output "rds_endpoint" {
    value = "${aws_db_instance.mysql.address}"
}

output "bastion_ip" {
    value = "${aws_instance.bastion.public_ip}"
}
