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