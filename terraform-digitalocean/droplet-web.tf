resource "digitalocean_droplet" "web" {
    count = 2
    image = "ubuntu-16-04-x64"
    name = "web-${count.index}"
    region = "sfo1"
    size = "512mb"
    private_networking = true
    ssh_keys = ["${var.ssh_id}"]

    connection {
        user = "root"
        type = "ssh"
        private_key = "${file("~/.ssh/id_rsa")}"
        timeout = "2m"
    }

    provisioner "remote-exec" {
        inline = [
            "sudo apt update",
            "sudo apt install -y nginx"
        ]
    }
}
