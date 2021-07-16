
module "nixos_image" {
    source  = "git::https://github.com/tweag/terraform-nixos.git//aws_image_nixos?ref=5f5a0408b299874d6a29d1271e9bffeee4c9ca71"
    release = "21.05"
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
}

resource "aws_instance" "nixos" {
    ami             = module.nixos_image.ami
    instance_type   = var.instance_type
    security_groups = [ aws_security_group.nixos.name ]
    key_name        = aws_key_pair.generated_key.key_name

    root_block_device {
        volume_size = var.ec2_volume_size
    }
}