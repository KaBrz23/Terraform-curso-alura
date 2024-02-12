terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = var.aws_region
}

resource "aws_instance" "app_server" {
  ami           = var.ami
  instance_type = var.instance
  key_name = aws_key_pair.chaveSSH.key_name
  security_groups = [ aws_security_group.general_access.name ]
  
  tags = {
    Name = "Terraform Ansible Python"
  }
}

resource "aws_key_pair" "chaveSSH" {
  key_name = var.SSHkey
  public_key = file("${var.SSHkey}.pub")
}

output "Public_IP" {
  value = aws_instance.app_server.public_ip
}