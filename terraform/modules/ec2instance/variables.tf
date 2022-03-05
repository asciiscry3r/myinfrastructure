// Copyright (C) 2022 by Klimenko Maxim Sergeevich

variable "ec2_volume_size" {
  default = 30
}

variable "vpc_id_main" {
  default = "vpc-096e5bbc5fbfa0ebc"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "encryption_state" {
  default = true
}

variable "deploy_nixos" {
  default = false
}

variable "instance_tag_name" {
 default = "Web server"
}
