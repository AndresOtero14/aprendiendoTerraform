# ********************
# Tipos de variables:
# - string
# - number
# - bool
# - any -> cualquier dato
# ************************

# aqui solo se crea la variables 
variable "virginia_cidr" {
}
variable "ohio_cidr" {
}


# OTRA FORMA DE LAS VARIABLES
# variable "virginia_cidr" {
#     default = "10.10.0.0/16"
#     description = "CIDR de la VPC  de Virginia"
#     type = string
#     sensitive = false   # esto puede ser (true o false)
# }
# variable "ohio_cidr" {
#     default = "10.20.0.0/16"
#     description = "CIDR de la VPC  de Ohio"
#     type = string
#     sensitive = true   # esto puede ser (true o false)
# }

## LISTAS 
# Todos los elementos de una lista deben ser del mismo tipo
# los valores se pueden repetir
variable "lista_cidrs" {
    default = ["10.10.0.0/16", "10.20.0.0/16"] 
    type = list(string)
}
## llamdo
# var.lista_cidrs[0]




## MAP
# clave - valor
variable "map_cidr" {
  default = {
    "virginia" = "10.10.0.0/16"
    "ohio"= "10.20.0.0/16"
  }
   type = map(string)
}
# llamado
# var.map_cidr["virginia"]



## SET
# parecido a la lista - casi no se usa
# no hay elementos repetidos 
# no se puede acceder a un elemento en particular
variable "set_cidr" {
    default =  ["10.10.0.0/16", "10.20.0.0/16"] 
    type = set(string)
}

# OBJECT
# primero se ponen los elementos del object y se pone su tipo  
# despues se ponen los valores en el default
variable "virginia" {
    type = object({
      nombre =  string
      cantidad = number
      cidrs = list(string)
      disponible = bool
      env = string
      Owner = string
    })
    default = {
      nombre = "andres"
      cantidad = 1
      cidrs = [ "10.10.0.0/16" ]
      disponible = false
      env = "dev"
      Owner = "Andres Otero"
    }
}

## Llamado 
# var.virginia.cidrs[0]
# Name =  var.virginia.nombre
# env = var.virginia.env


## TUPLAS
# similar a  una lista  y pueden tener diferentes tipos de datos 
variable "ohio" {
    type = tuple([ string, string, number, bool, string ])
    default = [ "Ohio", "10.10.0.0/16", 0, false, "Dev" ]
}
# LLAMADO  es igual que las listas
#Name =  var.ohio[0]
#dev = var.ohio[4]


## OUPUT
output "example_public_id" {
  value = aws_instance.recurso.public_id
  description = "Muestro la ip publica asifgnada a la instancia"
}