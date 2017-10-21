module "consul" {
    source = "github.com/cascadia-cookbooks/magento2-terraform-aws"
    # Override LastPass folder name
    lastpass-project = "CAS Magento 2 Module"
    # Override AWS region
    region = "us-west-1"
}
