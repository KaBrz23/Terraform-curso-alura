module "aws-prod" {
  source = "../../infra"
  ami = "ami-0623e7a7b489397c1"
  instance = "t3.micro"
  aws_region = "sa-east-1"
  SSHkey = "IaC-Prod"
}

output "IP" {
  value = module.aws-prod.Public_IP
}