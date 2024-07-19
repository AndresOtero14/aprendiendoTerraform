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
}