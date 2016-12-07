# CloudFront CDN Distribution
resource "aws_cloudfront_distribution" "wordpress_cdn" {
    enabled = true

    origin {
        domain_name = "${aws_s3_bucket.wordpress.id}.s3.amazonaws.com"
        origin_id = "S3-${aws_s3_bucket.wordpress.id}"
    }

    default_cache_behavior {
        allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
        cached_methods   = ["GET", "HEAD"]
        target_origin_id = "S3-${aws_s3_bucket.wordpress.id}"

        forwarded_values {
            query_string = true
            cookies {
                forward = "none"
            }
        }
    }

    viewer_certificate {
        cloudfront_default_certificate = true
    }
}
