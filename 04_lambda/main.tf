# Configure the AWS Provider
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs#provider-configuration

provider "aws" {
  region = "eu-west-1"
  # shared_credentials_files = ["~/.aws/credentials"]
  # access_key = "" # should not be used but there is this option
  # secret_key = "" # should not be used but there is this option
}

resource "aws_iam_role" "lambda_iam_role" {
 name   = "terraform_aws_lambda_iam_role"
 assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

# IAM policy for logging from a lambda
resource "aws_iam_policy" "iam_policy_for_lambda" {

  name         = "aws_iam_policy_for_terraform_aws_lambda_iam_role"
  path         = "/"
  description  = "AWS IAM Policy for managing aws lambda iam role"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*",
      "Effect": "Allow"
    }
  ]
}
EOF
}

# Policy Attachment on the role.
resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role" {
  role        = aws_iam_role.lambda_iam_role.name
  policy_arn  = aws_iam_policy.iam_policy_for_lambda.arn
}

# # Generates an archive from content, a file, or a directory of files.
# data "archive_file" "zip_the_python_code" {
#  type        = "zip"
#  source_dir  = "${path.module}/python/"
#  output_path = "${path.module}/python/hello-python.zip"
# }

# Create a lambda function
# In terraform ${path.module} is the current directory.
resource "aws_lambda_function" "terraform_lambda_func" {
 filename                       = "${path.module}/my-sourcecode-function/my-deployment-package.zip"
 function_name                  = "My-Lambda-Function"
 role                           = aws_iam_role.lambda_iam_role.arn
 handler                        = "lambda_function.lambda_handler"
 runtime                        = "python3.8"
 depends_on                     = [aws_iam_role_policy_attachment.attach_iam_policy_to_iam_role]
}


output "teraform_aws_role_output" {
 value = aws_iam_role.lambda_iam_role.name
}

output "teraform_aws_role_arn_output" {
 value = aws_iam_role.lambda_iam_role.arn
}

output "teraform_logging_arn_output" {
 value = aws_iam_policy.iam_policy_for_lambda.arn
}
