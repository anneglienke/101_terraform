# Creates User Groups
resource "aws_iam_group" "admindatalake" {
  name = "Admin-Datalake"
  path = "/"
}

resource "aws_iam_group" "dataengineer" {
  name = "Data-Engineer"
  path = "/"
}

resource "aws_iam_group" "dataanalyst" {
  name = "Data-Analyst"
  path = "/"
}

resource "aws_iam_group" "datascientist" {
  name = "Data-Scientist"
  path = "/"
}
