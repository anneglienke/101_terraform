# Create Glue Crawler to read consumer-zone
resource "aws_glue_catalog_database" "consumer_zone" {
  name = "dl_consumer_zone"
}

resource "aws_glue_crawler" "consumer_zone" {
  database_name = aws_glue_catalog_database.consumer_zone.name
  name          = "dl_consumer_zone_crawler"
  role          = aws_iam_role.glue_role.arn

  s3_target {
    path = "s3://${aws_s3_bucket.consumer_zone.bucket}"
  }

  tags = {
    foo = "bar"
  }
}
