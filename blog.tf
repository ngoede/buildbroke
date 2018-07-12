provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "blog_s3" {
  bucket = "www.nickgoede.com"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "aws_cloudfront_distribution" "blog_distribution" {
  origin {
    domain_name = "${aws_s3_bucket.blog_s3.bucket_regional_domain_name}"
    origin_id   = "blogOrigin"

    s3_origin_config {
      origin_access_identity = "origin-access-identity/cloudfront/ABCDEFG1234567"
    }
  }

  enabled         = true
  is_ipv6_enabled = true

  default_root_object = "index.html"

  aliases = ["www.nickgoede.com", "nickgoede.com"]

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "blogOrigin"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 31536000
    default_ttl            = 31536000
    max_ttl                = 31536000
  }
}
