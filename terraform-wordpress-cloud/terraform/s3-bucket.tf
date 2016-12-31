# S3 Bucket
resource "aws_s3_bucket" "wordpress" {
    bucket = "wordpress-cloud-bucket"
    tags {
        Name = "Wordpress S3 Bucket"
        group = "twc-s3"
    }
}
