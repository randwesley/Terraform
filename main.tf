provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias = "us-east-2"
  region = "us-east-2"
}

resource "aws_instance" "dev" {
  count = 3
  ami = "ami-09d56f8956ab235b3"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    "name" = "dev${count.index}"
  }
  vpc_security_group_ids = [ aws_security_group.acesso-ssh.id ]
}

resource "aws_instance" "dev4" {
  ami = "ami-09d56f8956ab235b3"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    "name" = "dev4"
  }
  vpc_security_group_ids = [ aws_security_group.acesso-ssh.id ]
  depends_on = [aws_s3_bucket.dev4]
}

resource "aws_instance" "dev5" {
  ami = "ami-09d56f8956ab235b3"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    "name" = "dev5"
  }
  vpc_security_group_ids = [ aws_security_group.acesso-ssh.id ]
}

resource "aws_instance" "dev6" {
  provider = aws.us-east-2
  ami = "ami-0fa49cc9dc8d62c84"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    "name" = "dev6"
  }
  vpc_security_group_ids = [ aws_security_group.acesso-ssh-us-east-2.id ]
}

resource "aws_s3_bucket" "dev4" {
  bucket = "wesleylabs-dev4"

  tags = {
    Name        = "wesleylabs-dev4"
  }
}