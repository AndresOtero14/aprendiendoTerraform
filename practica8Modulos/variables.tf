variable "virginia_cidr" {
  description = "cidrs de virginia"
  type = string
}

# variable "public_subnet" {
#   description = "CIDR public subnet"
#   type = string
# }

# variable "private_subnet" {
#   description = "CIDR private subnet"
#   type = string
# }

variable "subnets" {
  description = "Lista de subnets"
  type = list(string)
}

variable "tags" {
  description = "aqui estan los tags"
  type = map(string)
  
}


variable "sg_ingress_cidr" {
  description = "CIDR for ingress traffic"
  type = string
}


variable "ec2_specs" {
  description = "Prametras de la instancia"
  type = map(string)
  
}

variable "enable_monitoring" {
  description = "Habilita el despliegue de un servidor"
  type = bool
}

variable "ingress_puertos_list" {
  description = "lista de los puertos de ingreso"
  type = list(number)
  
}