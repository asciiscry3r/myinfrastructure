// Copyright (C) 2022 by Klimenko Maxim Sergeevich

module "deploy_uni_server" {
    source = "./modules/ec2instance"

//    name = "uni_server"

    instance_tag_name = "uni_server"
    deploy_nixos = false
    encryption_state = true
    instance_type = "t2.micro"
    vpc_id_main = "vpc-096e5bbc5fbfa0ebc"
    ec2_volume_size = "30"
    cidr_allowed_for_ssh = ["0.0.0.0/0"]
    server_record_name = "mkswebtower.online"
}

module "deploy_spec_server_1" {
    source = "./modules/ec2instance"

//    name = "spac_server_1"

    instance_tag_name = "spec_server_1"
    deploy_nixos = false
    encryption_state = true
    instance_type = "t2.micro"
    vpc_id_main = "vpc-096e5bbc5fbfa0ebc"
    ec2_volume_size = "30"
    cidr_allowed_for_ssh = ["0.0.0.0/0"]
    server_record_name = "temporary_didos_server"
}

module "deploy_spec_server_2" {
    source = "./modules/ec2instance"

//    name = "spec_server_2"

    instance_tag_name = "spec_server_2"
    deploy_nixos = false
    encryption_state = true
    instance_type = "t2.micro"
    vpc_id_main = "vpc-096e5bbc5fbfa0ebc"
    ec2_volume_size = "30"
    cidr_allowed_for_ssh = ["0.0.0.0/0"]
    server_record_name = "temporary_didos_server"
}

module "deploy_spec_server_3" {
    source = "./modules/ec2instance"

//    name = "spec_server_3"

    instance_tag_name = "spec_server_3"
    deploy_nixos = false
    encryption_state = true
    instance_type = "t2.micro"
    vpc_id_main = "vpc-096e5bbc5fbfa0ebc"
    ec2_volume_size = "30"
    cidr_allowed_for_ssh = ["0.0.0.0/0"]
    server_record_name = "temporary_didos_server"
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
