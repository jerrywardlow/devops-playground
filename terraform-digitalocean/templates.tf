data "template_file" "user_data_web" {
    template = "${file("templates/user_data_web.tpl")}"
}
