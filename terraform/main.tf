terraform {
  backend "s3" {
    bucket = "myinfra-terraform-state-store"
    key    = "us-east-1"
    region = "us-east-1"
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.50.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
