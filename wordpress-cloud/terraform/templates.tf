data "template_file" "user_data" {
    template = "${file("templates/user_data.tpl")}"

    vars {
        rds_endpoint = "${aws_db_instance.mysql.address}"
    }
}
