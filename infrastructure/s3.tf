# Create S3 buckets
# raw-data
resource "aws_s3_bucket" "raw_data" {
  bucket = "${var.bucket_raw_data}-${var.account}"
}

# staging-zone
resource "aws_s3_bucket" "staging_zone" {
  bucket = "${var.bucket_staging_zone}-${var.account}"
}

# curated-zone
resource "aws_s3_bucket" "curated_zone" {
  bucket = "${var.bucket_curated_zone}-${var.account}"
}

# consumer-zone
resource "aws_s3_bucket" "consumer_zone" {
  bucket = "${var.bucket_consumer_zone}-${var.account}"
}