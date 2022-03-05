// Copyright (C) 2022 by Klimenko Maxim Sergeevich

module "deploy_web_server" {
    source = ./modules/ec2instance
    instance_tag_name = "web_server"
    deploy_nixos = false
    encryption_state = true
    instance_type = "t2.micro"
    vpc_id_main = "vpc-096e5bbc5fbfa0ebc"
    ec2_volume_size = "30"
}

module "deploy_spec_server_1" {
    source = ./modules/ec2instance
    instance_tag_name = "spac_server_1"
    deploy_nixos = false
    encryption_state = true
    instance_type = "t2.micro"
    vpc_id_main = "vpc-096e5bbc5fbfa0ebc"
    ec2_volume_size = "30"
}

module "deploy_spec_server_2" {
    source = ./modules/ec2instance
    instance_tag_name = "spec_server_2"
    deploy_nixos = false
    encryption_state = true
    instance_type = "t2.micro"
    vpc_id_main = "vpc-096e5bbc5fbfa0ebc"
    ec2_volume_size = "30"
}
