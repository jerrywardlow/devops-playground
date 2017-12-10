provider "docker" {
    host = "unix:///var/run/docker.sock"
}

resource "docker_image" "haproxy" {
    name = "haproxy:latest"
} 

resource "docker_image" "nginx" {
    name = "nginx:latest"
}
