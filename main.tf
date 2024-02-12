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
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0e731c8a588258d0d"
  instance_type = "t2.micro"
  key_name      = "kaue-iac"
  
  # user_data = <<-EOF
  #  #!/bin/bash
  #  yum update -y
  #  yum install httpd -y
  #  service httpd start
  #  chkconfig httpd on
  #  echo "<h1>Feito com Terraform</h1>" > /var/www/html/index.html

  # EOF

  tags = {
    Name = "Terraform Ansible Python"
  }
}
      
      