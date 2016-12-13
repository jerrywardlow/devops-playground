# CloudFront CDN Distribution
resource "aws_cloudfront_distribution" "wordpress_cdn" {
    enabled = true
    price_class = "PriceClass_100"

    origin {
        domain_name = "${aws_s3_bucket.wordpress.id}.s3.amazonaws.com"
        origin_id = "S3-${aws_s3_bucket.wordpress.id}"
    }

    default_cache_behavior {
        allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
        cached_methods   = ["GET", "HEAD"]
        target_origin_id = "S3-${aws_s3_bucket.wordpress.id}"

        forwarded_values {
            query_string = false
            cookies {
                forward = "none"
            }
        }

        viewer_protocol_policy = "allow-all"
        min_ttl                = 0
        default_ttl            = 3600
        max_ttl                = 86400
    }

    restrictions {
        geo_restriction {
            restriction_type = "none"
        }
    }

    viewer_certificate {
        cloudfront_default_certificate = true
    }
}
