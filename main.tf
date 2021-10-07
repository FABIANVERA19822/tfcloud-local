resource "aws_instance" "testVMFV" {
  ami = data.aws_ami.amazon-linux2.image_id
  instance_type = "t2.micro"

  provisioner "local-exec" {
     command = "echo ${self.id} >> myvmid" #envia los el atributo a un archivo llamado myvmid
  }
}

data "aws_ami" "amazon-linux2"{
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"
    values = ["amzn2-ami-hvm-2.0.20200722.0-x86*"]
  }
}