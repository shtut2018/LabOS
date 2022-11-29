provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "danza-proj-bucket-2" {
  bucket = "danza-proj-bucket-2"

     
  lifecycle {
    prevent_destroy = false
  }

  tags = {
    name        = "Dan.Zaltsman"
  }  
}


resource "aws_s3_bucket_versioning" "danza-proj-bucket-2" {
    bucket = aws_s3_bucket.danza-proj-bucket-2.id

    versioning_configuration {
      status = "Disabled"
    }
}


resource "aws_dynamodb_table" "danza-proj-dynamo" {
  name           = "danza-proj-dynamo"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    name        = "Dan.Zaltsman"
  }  
}

resource "aws_s3_bucket_policy" "public_read_access" {
  bucket = aws_s3_bucket.danza-proj-bucket-2.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
	  "Principal": "*",
      "Action": [ "s3:*" ],
      "Resource": [
        "${aws_s3_bucket.danza-proj-bucket-2.arn}",
        "${aws_s3_bucket.danza-proj-bucket-2.arn}/*"
      ]
    }
  ]
}
EOF
}


resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket                  = aws_s3_bucket.danza-proj-bucket-2.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  depends_on = [aws_s3_bucket_policy.public_read_access]
}
