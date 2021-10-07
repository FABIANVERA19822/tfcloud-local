terraform {
  required_version = ">=0.13"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.59.0"
    }
  }
}

provider "aws1" {
  region = "us-east-1"
}
resource "aws_instance" "testVMFV" {
  ami = data.aws_ami.amazon-linux2.image_id
  instance_type = "t2.micro"
}

data "aws_ami" "amazon-linux2"{
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"
    values = ["amzn2-ami-hvm-2.0.20200722.0-x86*"]
  }
}