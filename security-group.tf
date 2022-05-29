resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "189.120.78.240"

  ingress {
    description      = "acesso-ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["189.120.78.240/32"]
  }


  tags = {
    Name = "ssh"
  }
}