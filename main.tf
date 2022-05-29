provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "dev" {
  count = 3
  ami = "ami-09d56f8956ab235b3"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    "name" = "dev${count.index}"
  }
  vpc_security_group_ids = [ "sg-0d883e0ca7448654d" ]
}

resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "189.120.78.240"

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["189.120.78.240/32"]
  }


  tags = {
    Name = "ssh"
  }
}