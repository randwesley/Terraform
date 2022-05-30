resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "189.120.78.240"

  ingress {
    description      = "acesso-ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = var.cdirs_acesso_remoto
  }
  tags = {
    Name = "ssh"
  }
}

resource "aws_security_group" "acesso-ssh-us-east-2" {
  provider = aws.us-east-2
  name        = "acesso-ssh-us-east-2"
  description = "189.120.78.240"

  ingress {
    description      = "acesso-ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = var.cdirs_acesso_remoto
  }
  tags = {
    Name = "ssh"
  }
}