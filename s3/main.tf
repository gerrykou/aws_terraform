# Configure the AWS Provider
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs#provider-configuration

provider "aws" {
  region = "eu-west-1"
  # access_key = "" # should not be used but there is this option
  # secret_key = "" # should not be used but there is this option
}

#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl

resource "aws_s3_bucket" "example" {
  bucket = "my-tf-example-bucket-456789876543"
}

resource "aws_s3_bucket_acl" "example_bucket_acl" {
  bucket = aws_s3_bucket.example.id
  acl    = "private"
}
