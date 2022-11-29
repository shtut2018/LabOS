# resource "aws_iam_policy" "s3access" {
#   name = "policy-s3access"

#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action   = ["s3:GetObject"]
#         Effect   = "Allow"
#         Resource = "*"
#       },
#     ]
#   })

#   tags = {
#     name = "Dan.Zaltsman"
#   }

# }

# resource "aws_iam_role" "s3_access_role" {
#   name = "s3_access_role"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = "sts:AssumeRole"
#         Effect = "Allow"
#         Sid    = ""
#         Principal = {
#           Service = "ec2.amazonaws.com"
#         }
#       },
#     ]
#   })

#   tags = {
#     name = "Dan.Zaltsman"
#   }
# }

# resource "aws_iam_role_policy_attachment" "s3_policy_attachment" {
#   role       = aws_iam_role.s3_access_role.name
#   policy_arn = aws_iam_policy.s3access.arn
# }

# resource "aws_iam_instance_profile" "iam_role_for_ec2" {
#   name = "iam_role_for_ec2"
#   role = aws_iam_role.s3_access_role.name

#   tags = {
#     name        = "Dan.Zaltsman"
#   }

# }