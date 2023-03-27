# Creates Athena Database - NOT TESTED YET
resource "aws_athena_database" "consumer_zone" {
  name   = "database_name"
  bucket = aws_s3_bucket.consumer_zone.bucket
}