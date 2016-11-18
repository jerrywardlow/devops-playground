resource "template_file" "user_data" {
    template = "templates/user_data"
    vars {
        rds_endpoint = ${"aws_db_instance.mysql.address"}
    }
}
