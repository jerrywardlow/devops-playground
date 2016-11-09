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
        private_key = "${file("~/.ssh/id_rsa")}"
        timeout = "2m"
    }

    provisioner "file" {
        source = "haproxy.cfg"
        destination = "/etc/haproxy/haproxy.cfg"
    }
    
    provisioner "remote-exec" {
        inline = [
            # Install HAProxy
            "sudo apt update",
            "sudo apt -y install haproxy",

            # Update /etc/haproxy/haproxy.cfg
            "sudo sed -i '/s/HAPROXY_PUBLIC_IP/${digitalocean_droplet.haproxy-web.ipv4_address}/g' /etc/haproxy/haproxy.cfg",
            "sudo sed -i '/s/WEB_1_PRIVATE_IP/${digitalocean_droplet.web-1.ipv4_address_private}/g' /etc/haproxy/haproxy.cfg",
            "sudo sed -i '/s/WEB_2_PRIVATE_IP/${digitalocean_droplet.web-2.ipv4_address_private}/g' /etc/haproxy/haproxy.cfg",

            # Restart haproxy
            "sudo systemctl restart haproxy"
        ]
    }
}
