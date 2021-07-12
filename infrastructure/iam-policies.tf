# Create policies

# S3: Raw data and Staging zone (read and write)
resource "aws_iam_policy" "rw_raw_staging" {
  name        = "rw_raw_and_staging"
  path        = "/"
  description = "Provides read and write permissions in raw data and staging zone"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Effect": "Allow",
          "Action": [
                "s3:GetBucketLocation",
                "s3:ListBucket",
                "s3:GetObject",
                "s3:PutObject"
          ],
          "Resource": ["arn:aws:s3:::raw-data", "arn:aws:s3:::staging-zone"]
      }
  ]
}

EOF
}

# S3: Curated zone (read)
resource "aws_iam_policy" "r_curated" {
  name        = "r_curated"
  path        = "/"
  description = "Provides read permissions in curated-zone"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Effect": "Allow",
          "Action": [
                "s3:GetBucketLocation",
                "s3:ListBucket",
                "s3:GetObject"
          ],
          "Resource": ["arn:aws:s3:::curated-zone"]
      }
  ]
}

EOF
}

# S3: Curated zone (write)
resource "aws_iam_policy" "w_curated" {
  name        = "w_curated"
  path        = "/"
  description = "Provides write permissions in curated-zone"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Effect": "Allow",
          "Action": [
                "s3:GetBucketLocation",
                "s3:ListBucket",
                "s3:PutObject"
          ],
          "Resource": ["arn:aws:s3:::curated-zone"]
      }
  ]
}

EOF
}

# S3: Consumer zone (read)
resource "aws_iam_policy" "r_consumer" {
  name        = "r_consumer"
  path        = "/"
  description = "Provides read permissions in consumer-zone"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Effect": "Allow",
          "Action": [
                "s3:GetBucketLocation",
                "s3:ListBucket",
                "s3:GetObject"
          ],
          "Resource": ["arn:aws:s3:::consumer-zone"]
      }
  ]
}

EOF
}

# S3: Consumer zone (write)
resource "aws_iam_policy" "w_consumer" {
  name        = "w_consumer"
  path        = "/"
  description = "Provides write permissions in consumer-zone"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Effect": "Allow",
          "Action": [
                "s3:GetBucketLocation",
                "s3:ListBucket",
                "s3:PutObject"
          ],
          "Resource": ["arn:aws:s3:::consumer-zone"]
      }
  ]
}

EOF
}

# S3: Delete all
resource "aws_iam_policy" "delete_all" {
  name        = "delete_all"
  path        = "/"
  description = "Provides object deletion permissions in all zones"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Effect": "Allow",
          "Action": [
                "s3:GetBucketLocation",
                "s3:ListBucket",
                "s3:DeleteObject",
                "s3:DeleteObjectVersion"
          ],
          "Resource": ["arn:aws:s3:::raw-data", "arn:aws:s3:::staging-zone", "arn:aws:s3:::enriched-zone", "arn:aws:s3:::sandbox", "arn:aws:s3:::consumer-zone", "arn:aws:s3:::curated-zone"]
      }
  ]
}

EOF
}

# Glue Crawler
resource "aws_iam_policy" "glue_policy" {
  name        = "AWSGlueServiceRole"
  path        = "/"
  description = "Policy for AWS Glue service role which allows access to related services including EC2, S3, and Cloudwatch Logs"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "glue:*",
                "s3:GetBucketLocation",
                "s3:ListBucket",
                "s3:ListAllMyBuckets",
                "s3:GetBucketAcl",
                "ec2:DescribeVpcEndpoints",
                "ec2:DescribeRouteTables",
                "ec2:CreateNetworkInterface",
                "ec2:DeleteNetworkInterface",
                "ec2:DescribeNetworkInterfaces",
                "ec2:DescribeSecurityGroups",
                "ec2:DescribeSubnets",
                "ec2:DescribeVpcAttribute",
                "iam:ListRolePolicies",
                "iam:GetRole",
                "iam:GetRolePolicy",
                "cloudwatch:PutMetricData"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:CreateBucket"
            ],
            "Resource": [
                "arn:aws:s3:::aws-glue-*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetObject",
                "s3:PutObject",
                "s3:DeleteObject"
            ],
            "Resource": [
                "arn:aws:s3:::aws-glue-*/*",
                "arn:aws:s3:::*/*aws-glue-*/*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::crawler-public*",
                "arn:aws:s3:::aws-glue-*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": [
                "arn:aws:logs:*:*:/aws-glue/*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "ec2:CreateTags",
                "ec2:DeleteTags"
            ],
            "Condition": {
                "ForAllValues:StringEquals": {
                    "aws:TagKeys": [
                        "aws-glue-service-resource"
                    ]
                }
            },
            "Resource": [
                "arn:aws:ec2:*:*:network-interface/*",
                "arn:aws:ec2:*:*:security-group/*",
                "arn:aws:ec2:*:*:instance/*"
            ]
        }
    ]
}
EOF
}

# Athena
resource "aws_iam_policy" "athena_policy" {
  name        = "AWSAthenaFullAccess"
  path        = "/"
  description = "Provides full access to Athena."

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "athena:*"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "glue:CreateDatabase",
                "glue:DeleteDatabase",
                "glue:GetDatabase",
                "glue:GetDatabases",
                "glue:UpdateDatabase",
                "glue:CreateTable",
                "glue:DeleteTable",
                "glue:BatchDeleteTable",
                "glue:UpdateTable",
                "glue:GetTable",
                "glue:GetTables",
                "glue:BatchCreatePartition",
                "glue:CreatePartition",
                "glue:DeletePartition",
                "glue:BatchDeletePartition",
                "glue:UpdatePartition",
                "glue:GetPartition",
                "glue:GetPartitions",
                "glue:BatchGetPartition"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetBucketLocation",
                "s3:GetObject",
                "s3:ListBucket",
                "s3:ListBucketMultipartUploads",
                "s3:ListMultipartUploadParts",
                "s3:AbortMultipartUpload",
                "s3:CreateBucket",
                "s3:PutObject"
            ],
            "Resource": [
                "arn:aws:s3:::aws-athena-query-results-*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetObject",
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::athena-examples*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket",
                "s3:GetBucketLocation",
                "s3:ListAllMyBuckets"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "sns:ListTopics",
                "sns:GetTopicAttributes"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "cloudwatch:PutMetricAlarm",
                "cloudwatch:DescribeAlarms",
                "cloudwatch:DeleteAlarms"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
}
EOF
}

