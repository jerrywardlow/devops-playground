# Salt master
resource "digitalocean_droplet" "master" {
    image = "centos-7-x64"
    name = "master"
    region = "sfo1"
    size = "512mb"
    private_networking = true

    ssh_keys = ["${var.ssh_id}"]
}
