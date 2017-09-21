provider "digitalocean" {
    token = "${module.lpass_data.lpass_do_token}"
}

module "lpass_data" {
    source = "./lpass_data"
}

module "droplet_test" {
    source = "./node"
    name = "test_node"
    ssh_keys = ["666", "420"]
    user_data = "./provider/main.tf"
}
