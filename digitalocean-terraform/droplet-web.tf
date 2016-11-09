resource "digitalocean_droplet" "web-1" {
    image = "ubuntu-14-04-x64"
    name = "web-1"
    region = "sfo1"
    size = "512mb"
    private_networking = true
    ssh_keys = ["${var.ssh_id}"]

    connection {
        user = "root"
        type = "ssh"
        key_file = "~/.ssh/id_rsa"
        timeout = "2m"
    }

    provisioner "remote-exec" {
        inline = [
            "sudo apt update",
            "sudo apt install -y nginx"
        ]
    }
}

resource "digitalocean_droplet" "web-2" {
    image = "ubuntu-16-04-x64"
    name = "web-2"
    region = "sfo1"
    size = "512mb"
    private_networking = true
    ssh_keys = ["${var.ssh_id}"]

    connection {
        user = "root"
        type = "ssh"
        key_file = "~/.ssh/id_rsa"
        timeout = "2m"
    }

    provisioner "remote-exec" {
        inline = [
            "sudo apt update",
            "sudo apt install -y nginx"
        ]
    }
}
