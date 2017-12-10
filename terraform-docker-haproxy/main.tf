provider "docker" {
    host = "unix:///var/run/docker.sock"
}

resource "docker_image" "haproxy" {
    name = "haproxy:alpine"
} 

resource "docker_image" "nginx" {
    name = "nginx:alpine"
}
