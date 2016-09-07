# Highly Available Wordpress with Terraform
### A demonstration of AWS technologies

### About

The goal of this project is to use Terraform to deploy a scalable Wordpress cloud application across Amazon Web Services products. The core application servers are launched on EC2 t2.micro services, balanced behind Elastic Load Balancer. Data is stored on a Relational Database Service MySQL instance and cached on ElastiCache/Redis. CloudFront is used as a content delivery network (CDN) and storage is facilitated with S3.
