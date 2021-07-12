# Attach policies to user groups and roles

# User groups
# Admin-Datalake
resource "aws_iam_group_policy_attachment" "admindatalake-attach1" {
  group      = aws_iam_group.admindatalake.name
  policy_arn = aws_iam_policy.rw_raw_staging.arn
}

resource "aws_iam_group_policy_attachment" "admindatalake-attach2" {
  group      = aws_iam_group.admindatalake.name
  policy_arn = aws_iam_policy.r_curated.arn
}

resource "aws_iam_group_policy_attachment" "admindatalake-attach3" {
  group      = aws_iam_group.admindatalake.name
  policy_arn = aws_iam_policy.w_curated.arn
}

resource "aws_iam_group_policy_attachment" "admindatalake-attach4" {
  group      = aws_iam_group.admindatalake.name
  policy_arn = aws_iam_policy.r_consumer.arn
}

resource "aws_iam_group_policy_attachment" "admindatalake-attach5" {
  group      = aws_iam_group.admindatalake.name
  policy_arn = aws_iam_policy.w_consumer.arn
}

resource "aws_iam_group_policy_attachment" "admindatalake-attach9" {
  group      = aws_iam_group.admindatalake.name
  policy_arn = aws_iam_policy.delete_all.arn
}

# Data-Engineer 
resource "aws_iam_group_policy_attachment" "dataengineer-attach1" {
  group      = aws_iam_group.dataengineer.name
  policy_arn = aws_iam_policy.rw_raw_staging.arn
}

resource "aws_iam_group_policy_attachment" "dataengineer-attach2" {
  group      = aws_iam_group.dataengineer.name
  policy_arn = aws_iam_policy.r_curated.arn
}

resource "aws_iam_group_policy_attachment" "dataengineer-attach3" {
  group      = aws_iam_group.dataengineer.name
  policy_arn = aws_iam_policy.w_curated.arn
}

resource "aws_iam_group_policy_attachment" "dataengineer-attach4" {
  group      = aws_iam_group.dataengineer.name
  policy_arn = aws_iam_policy.r_consumer.arn
}

resource "aws_iam_group_policy_attachment" "dataengineer-attach5" {
  group      = aws_iam_group.dataengineer.name
  policy_arn = aws_iam_policy.w_consumer.arn
}

# Data-Scientist 
resource "aws_iam_group_policy_attachment" "datascientist-attach1" {
  group      = aws_iam_group.datascientist.name
  policy_arn = aws_iam_policy.r_curated.arn
}

resource "aws_iam_group_policy_attachment" "datascientist-attach2" {
  group      = aws_iam_group.datascientist.name
  policy_arn = aws_iam_policy.r_consumer.arn
}

# Data-Analyst 
resource "aws_iam_group_policy_attachment" "dataanalyst-attach2" {
  group      = aws_iam_group.dataanalyst.name
  policy_arn = aws_iam_policy.r_consumer.arn
}

# Roles
# Glue Crawler
resource "aws_iam_role_policy_attachment" "glue_attach" {
  role       = aws_iam_role.glue_role.name
  policy_arn = aws_iam_policy.glue_policy.arn
}

# Athena
resource "aws_iam_role_policy_attachment" "athena_attach" {
  role       = aws_iam_role.athena_role.name
  policy_arn = aws_iam_policy.athena_policy.arn
}

