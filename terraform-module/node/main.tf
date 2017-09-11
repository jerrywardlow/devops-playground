# Digital Ocean Droplet
resource "digitalocean_droplet" "droplet" {
    count              = "${var.count}"
    name               = "${var.name}"
    image              = "${var.image}"
    size               = "${var.size}"
    region             = "${var.region}"
    backups            = "${var.backups}"
    ssh_keys           = "${var.ssh_keys}"
    user_data          = "${var.user_data}"
    private_networking = "${var.private_networking}"
}
