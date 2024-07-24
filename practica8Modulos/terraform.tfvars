# en este archivo se les asigna valor a las variables
virginia_cidr = "10.10.0.0/16"
# public_subnet = "10.10.0.0/24"
# private_subnet = "10.10.1.0/24"
subnets = ["10.10.0.0/24", "10.10.1.0/24"]

#ajustes 
tags = {
  "env" = "dev"
  "owner" = "Andres Otero"
  "cloud" = "AWS"
  "IAC_version" = "1.9.0"
  "project" = "cerberus"
  "region"  = "virginia"
}

sg_ingress_cidr = "0.0.0.0/0"

ec2_specs = {
  "ami" = "ami-0b72821e2f351e396"
  "instance_type" = "t2.micro"
}

enable_monitoring  =  false

ingress_puertos_list = [ 22,80,443 ]