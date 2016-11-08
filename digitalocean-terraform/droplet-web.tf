resource "digitalocean_droplet" "web-1" {
    image = "ubuntu-14-04-x64"
    name = "web-1"
    region = "sfo1"
    size = "512mb"
    private_networking = true
    ssh_keys = ["${var.ssh_id}"]
}

resource "digitalocean_droplet" "web-2" {
    image = "ubuntu-16-04-x64"
    name = "web-2"
    region = "sfo1"
    size = "512mb"
    private_networking = true
    ssh_keys = ["${var.ssh_id}"]
}
