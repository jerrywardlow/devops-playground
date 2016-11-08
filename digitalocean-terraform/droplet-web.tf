resource "digitalocean_droplet" "web-1" {
    image = "ubuntu-14-04-x64"
    name = "web-1"
    region = "sfo1"
    size = "512mb"
    private_networking = true
    ssh_keys = ["${var.ssh_id}"]
}
