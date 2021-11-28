//Copyright (C) 2021 by Klimenko Maxim Sergievich

data "aws_vpc" "nixos" {
  id = var.vpc_id_main
}

resource "aws_security_group" "nixos" {
  count       = (var.deploy_nixos != false ? 1 : 0 )
  name        = "nixos_server_security_group"
  description = "Allow inbound traffic"
  vpc_id      = data.aws_vpc.nixos.id

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.cidr_allowed_for_ssh]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "NixOS"
    Env  = "mksplayground"
  }
}

resource "aws_security_group" "server" {
  name        = "server_security_group"
  description = "Allow inbound traffic"
  vpc_id      = data.aws_vpc.nixos.id

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.cidr_allowed_for_ssh]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Server"
    Env  = "mksplayground"
  }
}