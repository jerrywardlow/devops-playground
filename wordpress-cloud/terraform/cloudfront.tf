# CloudFront CDN Distribution
resource "aws_cloudfront_distribution" "wordpress_cdn" {
    origin {
        domain_name = "${aws_s3_bucket.wordpress.id}.s3.amazonaws.com"
        origin_id = "S3-${aws_s3_bucket.wordpress.id}"
    }
}
