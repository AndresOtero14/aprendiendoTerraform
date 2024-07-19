resource "aws_instance" "public_instance" {
  ami                     = "ami-0b72821e2f351e396"
  instance_type           = "t2.micro"
  subnet_id = aws_subnet.public_subnet.id
  key_name = data.aws_key_pair.developer_key.key_name
  vpc_security_group_ids = [ aws_security_group.sg_public_instance.id ]



#Esto es para evitar que se borren los recursos 
 # lifecycle {
    #create_before_destroy = true   #primero crea y luego destruye 
    #prevent_destroy = true   # esto es para prevenir que se destruyan las instancias 
   ## todo lo que este dentro del ignore chenges, no tomara los cambios 
    # ignore_changes = [ 
    #   ami,
    #   subnet_id
    #  ]

   # replace_triggered_by = [ 

 # }



}