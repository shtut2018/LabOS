# resource "aws_s3_bucket_object" "object" {
#   bucket = aws_s3_bucket.danza-proj-bucket-2.id
#   key    = "/python/PythonCode.zip"
#   source = "../../ProjectPT/PythonCode.zip"
#   etag = filemd5("../../ProjectPT/PythonCode.zip")

# }
