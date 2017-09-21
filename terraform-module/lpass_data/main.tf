data "external" "lpass" {
    program = ["bash", "${path.module}/lpass_data.sh"]
}

output "lpass_do_token" {
    value = "${data.external.lpass.result.do_token}"
}
