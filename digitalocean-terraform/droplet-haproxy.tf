resource "digitalocean_droplet" "haproxy-web" {
    image = "ubuntu-16-04-x64"
    name = "haproxy-web"
    region = "sfo1"
    size = "512mb"
    private_networking = true
    ssh_keys = ["${var.ssh_id}"]
}
