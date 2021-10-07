terraform {
  required_version = ">=0.13"
}

provider "aws" {
  region = "us-east-1"
  version = "3.61.0"
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