// Copyright (C) 2021 by Klimenko Maxim Sergievich

variable "aws_region" {
  default = "eu-central-1"
}

variable "aws_zone_id" {
  default = "Z04198522YOLQ6VGJR0UL"
}

variable "vpc_id_main" {
  default = "vpc-096e5bbc5fbfa0ebc"
}

variable "cidr_allowed_for_ssh" {
  default = ["0.0.0.0/0"]
}

variable "encryption_state" {
  default = true
}

variable "deploy_nixos" {
  default = false
}

variable "instance_tag_name" {
 default = "web_server"
}

variable "server_record_name" {
  default = "mkswebtower.online"
}

variable "server_record_type" {
  default = "A"
}

variable "server_record_ttl" {
  default = 300
}
