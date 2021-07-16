variable "aws_region" {
  default = "us-east-1"
}

//variable "remote_state_backet" {
//  default = "myinfra-terraform-state-store"
//}
//
//variable "remote_state_backet_key" {
//  default = "us-east-1"
//}

variable "ec2_volume_size" {
  default = 30
}

variable "zone_id" {
  default = "Z08690643G2MCG6F1C5D7"
}

variable "vpc_id_main" {
  default = "vpc-5b018826"
}

variable "instance_type" {
  default = "t2.micro"
}