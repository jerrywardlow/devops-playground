data "external" "lpass" {
    program = ["bash", "${path.module}/lpass_data.sh"]
}

output "lpass_do_token" {
    value = "${data.external.lpass.result.do_token}"
}

output "lpass_github_key" {
    value = "${data.external.lpass.result.github_key}"
}

output "lpass_chef_secret_key" {
    value = "${data.external.lpass.result.chef_secret_key}"
}
