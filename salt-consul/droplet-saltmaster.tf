# Salt master
resource "digitalocean_droplet" "master" {
    image = "centos-7-x64"
    name = "master"
    region = "sfo1"
    size = "512mb"
    private_networking = true

    ssh_keys = ["${var.ssh_id}"]

    connection {
        type = "ssh"
        host = "${digitalocean_droplet.master.ipv4_address}"
        port = 22
        timeout = "5m"
        user = "root"
        key_file = "~/.ssh/id_rsa" # Update target as necessary
    }
}
