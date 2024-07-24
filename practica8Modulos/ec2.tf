##  De esta  forma se aplica en COUNT para crear varias instancias al tiempo 

# variable "instancias" {
#   description = "nombre de las instancias"
#   type = list(string)
#   default = [ "apache", "mysql", "jumpserver"]
# }

# resource "aws_instance" "public_instance" {
#   count =  length(var.instancias)
#   ami                     = var.ec2_specs.ami
#   instance_type           = var.ec2_specs.instance_type
#   subnet_id = aws_subnet.public_subnet.id
#   key_name = data.aws_key_pair.developer_key.key_name
#   vpc_security_group_ids = [ aws_security_group.sg_public_instance.id]
#   user_data = file("script/userdata.sh") 

#   tags =  {
#     "Name" = var.instancias[count.index]
#   }
# }


## FOR EACH


variable "instancias" {
  description = "nombre de las instancias"
  type = set(string)
  default = [ "apache"]
}

resource "aws_instance" "public_instance" {
  #parseo de lista a set 
  #for_each = toset(var.instancias)
  for_each = var.instancias
  ami                     = var.ec2_specs.ami
  instance_type           = var.ec2_specs.instance_type
  subnet_id = aws_subnet.public_subnet.id
  key_name = data.aws_key_pair.developer_key.key_name
  vpc_security_group_ids = [ aws_security_group.sg_public_instance.id]
  user_data = file("script/userdata.sh") 

  tags =  {
    "Name" = "${each.value}-${local.sufix}"
  }
}

# CONDICIONALES 
resource "aws_instance" "monitoring_instance" {
 count = var.enable_monitoring ? 1 : 0
  ami                     = var.ec2_specs.ami
  instance_type           = var.ec2_specs.instance_type
  subnet_id = aws_subnet.public_subnet.id
  key_name = data.aws_key_pair.developer_key.key_name
  vpc_security_group_ids = [ aws_security_group.sg_public_instance.id]
  user_data = file("script/userdata.sh") 

  tags =  {
    "Name" = "Monitoreo-${local.sufix}"
  }
}