# Region
variable "aws_region" {
  default = "us-east-1"
}

# S3 Buckets
variable "bucket_raw_data" {
  default = "raw-data"
}
variable "bucket_staging_zone" {
  default = "staging-zone"
}
variable "bucket_curated_zone" {
  default = "curated-zone"
}
variable "bucket_consumer_zone" {
  default = "consumer-zone"
}

# Account
variable "account" {
  default = 1234567890
}




