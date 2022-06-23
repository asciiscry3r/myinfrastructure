// Copyright (C) 2022 by Klimenko Maxim Sergeevich

data "aws_arch_ami" "ami" {
  id = "ami-0f670c4daa876739f"
}

module "deploy_uni_server" {
    source = "./modules/ec2instance"

    instance_tag_name = "uni_server"
    deploy_nixos = false
    deploy_ubuntu = true
    deploy_arch = false
    aws_arch_ami = data.aws_arch_ami.ami.id
    encryption_state = true
    instance_type = "t2.micro"
    vpc_id_main = "vpc-096e5bbc5fbfa0ebc"
    ec2_volume_size = "30"
    cidr_allowed_for_ssh = [ var.cidr_allowed_for_ssh ]
    server_record_name = "mksscryertower.quest"
    web_server_ingress = true
}

module "deploy_spec_server_1" {
    source = "./modules/ec2instance"

    instance_tag_name = "spec_server_1"
    deploy_nixos = false
    deploy_ubuntu = true
    deploy_arch = false
    encryption_state = true
    instance_type = "t2.micro"
    vpc_id_main = "vpc-096e5bbc5fbfa0ebc"
    ec2_volume_size = "30"
    cidr_allowed_for_ssh = [ var.cidr_allowed_for_ssh ]
    server_record_name = "temporary_didos_server"
    web_server_ingress = false
}

module "deploy_spec_server_2" {
    source = "./modules/ec2instance"

    instance_tag_name = "spec_server_2"
    deploy_nixos = false
    deploy_ubuntu = true
    deploy_arch = false
    encryption_state = true
    instance_type = "t2.micro"
    vpc_id_main = "vpc-096e5bbc5fbfa0ebc"
    ec2_volume_size = "30"
    cidr_allowed_for_ssh = [ var.cidr_allowed_for_ssh ]
    server_record_name = "temporary_didos_server"
    web_server_ingress = false
}

module "deploy_spec_server_3" {
    source = "./modules/ec2instance"

    instance_tag_name = "spec_server_3"
    deploy_nixos = false
    deploy_ubuntu = true
    deploy_arch = false
    encryption_state = true
    instance_type = "t2.micro"
    vpc_id_main = "vpc-096e5bbc5fbfa0ebc"
    ec2_volume_size = "30"
    cidr_allowed_for_ssh = [ var.cidr_allowed_for_ssh ]
    server_record_name = "temporary_didos_server"
    web_server_ingress = false
}

//resource "aws_route53_record" "web-server" {
//  zone_id = var.aws_zone_id
//  name = var.server_record_name
//  type = var.server_record_type
//  ttl = var.server_record_ttl
//  records = [
//    aws_eip.server.public_ip
//  ]
//}
