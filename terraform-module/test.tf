module "lpass_data" {
    source = "./lpass_data"
}

module "do_provider" {
    source = "./provider"
    do_token = "5"
}

module "droplet_test" {
    source = "./node"
    name = "test_node"
    ssh_keys = ["666", "420"]
    user_data = "./provider/main.tf"
}
