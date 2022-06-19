# Configure the AWS Provider
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs#provider-configuration

provider "aws" {
  region = "eu-west-1"
  # access_key = "" # should not be used but there is this option
  # secret_key = "" # should not be used but there is this option
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs#provider-configuration
resource "aws_instance" "my-first-server" {
  ami           = "ami-0d75513e7706cf2d9"
  instance_type = "t2.micro"
  tags = {
    Name = "ubuntu"
  }
}