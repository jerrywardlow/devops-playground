data "external" "test" {
    program = ["bash", "${path.module}/external.sh"]
}

output "wapple-output" {
    value = "${data.external.test.result.wapple}"
}
