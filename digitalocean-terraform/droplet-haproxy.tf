resource "digitalocean_droplet" "haproxy-web" {
    image = "ubuntu-16-04-x64"
    name = "haproxy-web"
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

    provisioner "file" {
        source = "haproxy.cfg"
        destination = "/etc/haproxy/haproxy.cfg"
    }
    
    provisioner "remote-exec" {
        inline = [
            # Install HAProxy
            "sudo apt update"
            "sudo apt -y install haproxy"
        ]
    }
}
