provider "aws"  {
    region = "us-east-1"
}

module "sg" {
  source = "./sg"
}

module "cicd" {
  source = "./cicd"
  serverstraffic_sg-name = module.sg.serverstraffic_sg-name
}

module "tomcat" {
  source = "./tomcat"
  serverstraffic_sg-name = module.sg.serverstraffic_sg-name
}

output "cicd-ip" {
  value = module.cicd.cicd-ip
}


output "tomcat-ip" {
  value = module.tomcat.tomcat-ip
}