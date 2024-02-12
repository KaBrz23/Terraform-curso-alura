module "aws-dev" {
  source = "../../infra"
  ami = "ami-0e731c8a588258d0d"
  instance = "t2.micro"
  aws_region = "us-east-1"
  SSHkey = "IaC-DEV"
}

output "IP" {
  value = module.aws-dev.Public_IP
}