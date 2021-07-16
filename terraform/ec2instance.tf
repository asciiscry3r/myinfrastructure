module "nixos_image" {
    source  = "git::https://github.com/tweag/terraform-nixos.git//aws_image_nixos?ref=5f5a0408b299874d6a29d1271e9bffeee4c9ca71"
    release = "20.09"
}

resource "tls_private_key" "state_ssh_key" {
    algorithm = "RSA"
}

resource "local_file" "machine_ssh_key" {
    sensitive_content = tls_private_key.state_ssh_key.private_key_pem
    filename          = "${path.module}/id_rsa.pem"
    file_permission   = "0600"
}

resource "aws_key_pair" "generated_key" {
    key_name   = "generated-key-${sha256(tls_private_key.state_ssh_key.public_key_openssh)}"
    public_key = tls_private_key.state_ssh_key.public_key_openssh

    tags = {
        Name = "NixOS"
    }
}

resource "aws_kms_key" "nixos" {
    count       = (var.encryption_state != false ? 1 : 0 )
    description = "nixos crypto key"

    tags = {
        Name = "NixOS"
    }
}

resource "aws_instance" "nixos" {
    ami             = module.nixos_image.ami
    instance_type   = var.instance_type
    security_groups = [ aws_security_group.nixos.name ]
    key_name        = aws_key_pair.generated_key.key_name

    root_block_device {
        encrypted   = var.encryption_state
        #kms_key_id  = aws_kms_key.nixos[0].key_id
        volume_size = var.ec2_volume_size

        tags = {
            Name = "NixOS"
        }
    }

    tags = {
        Name = "NixOS"
    }
}

# WIP
module "deploy_nixos" {
    source = "git::https://github.com/tweag/terraform-nixos.git//deploy_nixos?ref=5f5a0408b299874d6a29d1271e9bffeee4c9ca71"
    nixos_config = "${path.module}/../nixos/configuration.nix"
    target_host = aws_instance.nixos.public_ip
    ssh_private_key_file = local_file.machine_ssh_key.filename
    ssh_agent = false
}
