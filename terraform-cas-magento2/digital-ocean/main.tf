module "magento" {
    source = "github.com/cascadia-cookbooks/magento2-terraform-digitalocean"

    # Override LastPass
    lastpass_project = "CAS Magento 2 Module"

    # Project identifier
    project_id = "module_test"

    # Data center region
    region = "sfo1"

    # Environment
    environment = "test"
}
