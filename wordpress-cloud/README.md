# Highly Available Wordpress with Terraform
### A demonstration of AWS technologies

### About

The goal of this project is to use Terraform to deploy a scalable Wordpress cloud application across Amazon Web Services products. The core application servers are launched on EC2 t2.micro services, balanced behind Elastic Load Balancer. Data is stored on a Relational Database Service MySQL instance and cached on ElastiCache/Redis. CloudFront is used as a content delivery network (CDN) and storage is facilitated with S3.

### Deployment

Terraform, a HashiCorp product, is used as an Infrastructure as Code solution and allows for version control of the state of the architecture. Changes are tracked in a .tfstate file to accurately account for created resources. Incremental changes to the Terraform configuration can be easily tracked to see what has been updated and when. Disasters can be avoided; if a component is accidentally destroyed, Terraform brings us back to the desired state.

### Notes

An SSH key pair must be generated in `./ssh/` with the name `wordpress-key`.
