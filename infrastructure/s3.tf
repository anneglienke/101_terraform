# Create S3 buckets
# raw-data
resource "aws_s3_bucket" "raw_data" {
  bucket = "${var.bucket_raw_data}-${var.account}"
  acl    = "private"
  
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

# staging-zone
resource "aws_s3_bucket" "staging_zone" {
  bucket = "${var.bucket_staging_zone}-${var.account}"
  acl    = "private"
  
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

# curated-zone
resource "aws_s3_bucket" "curated_zone" {
  bucket = "${var.bucket_curated_zone}-${var.account}"
  acl    = "private"
  
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

# consumer-zone
resource "aws_s3_bucket" "consumer_zone" {
  bucket = "${var.bucket_consumer_zone}-${var.account}"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}