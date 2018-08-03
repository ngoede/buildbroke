provider "aws" {
  region = "us-east-1"
}

data "aws_acm_certificate" "blog_cert" {
  domain = "www.nickgoede.com"
}

resource "aws_s3_bucket" "blog" {
  bucket = "www.nickgoede.com"

  acl           = "private"
  force_destroy = false

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "aws_cloudfront_distribution" "blog_distribution" {
  origin {
    domain_name = "${aws_s3_bucket.blog.website_endpoint}"
    origin_id   = "S3-www.nickgoede.com"

    custom_origin_config {
      http_port = 80
      https_port = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols = ["TLSv1", "TLSv1.1", "TLSv1.2"]
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

  viewer_certificate {
    acm_certificate_arn = "${data.aws_acm_certificate.blog_cert.arn}"
    ssl_support_method  = "sni-only"
  }

  default_cache_behavior {
    allowed_methods  = ["HEAD", "GET"]
    cached_methods   = ["HEAD", "GET"]
    target_origin_id = "S3-www.nickgoede.com"
    compress         = true

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
