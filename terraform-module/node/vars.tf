variable "count" {
    default = 1
}

variable "name" {
    description = "Droplet hostname"
}

variable "image" {
    default = "ubuntu-16-04-x64"
    description = "Ubuntu Xenial"
}

variable "size" {
    default = "512mb"
}

variable "region" {
    default = "sfo1"
}

variable "backups" {
    default = false
}

variable "ssh_keys" {
    description = "List of DigitalOcean SSH key fingerprints"
    type = "list"
}

variable "user_data" {
    description = "Path or rendered content for User Data"
}

variable "private_networking" {
    default = false
}
