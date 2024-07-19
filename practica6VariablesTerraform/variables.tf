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