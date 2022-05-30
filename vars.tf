variable "amis" {
  type = map

  default = {
      "us-east-1" = "ami-09d56f8956ab235b3"
      "us-east-2" = "ami-0fa49cc9dc8d62c84"
  }
}

variable "cdirs_acesso_remoto" {
  type = list

  default = [ "189.120.78.240/32"]
}