resource "digitalocean_droplet" "web" {
    count = 2
    image = "ubuntu-16-04-x64"
    name = "web-${count.index}"
    region = "sfo1"
    size = "512mb"
    private_networking = true
    ssh_keys = ["${var.ssh_id}"]

    user_data = "${data.template_file.user_data_web.rendered}"
}
