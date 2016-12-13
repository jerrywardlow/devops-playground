output "rds_endpoint" {
    value = "${aws_db_instance.mysql.address}"
}

output "bastion_ip" {
    value = "${aws_instance.bastion.public_ip}"
}

output "elb_app_dns" {
    value = "${aws_elb.app.dns_name}"
}
