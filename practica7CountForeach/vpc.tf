resource "aws_vpc" "vpc_virginia" {
  cidr_block = var.virginia_cidr  # aqui se llama la variables
   tags = {
    "Name" = "vpc_virginia"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.vpc_virginia.id
  cidr_block = var.subnets[0]
  map_public_ip_on_launch = true  ## asigna direcciones id publicas -- por defecto van en false
  tags = {
    "Name" = "public subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.vpc_virginia.id
  cidr_block = var.subnets[1]
  tags = {
    "Name" = "private subnet"
  }
}

resource "aws_internet_gateway" "igw_vpc_virginia" {
  vpc_id = aws_vpc.vpc_virginia.id
  tags = {
    Name = "igw vpc virginia"
  }
}




resource "aws_route_table" "public_crt" {
  vpc_id = aws_vpc.vpc_virginia.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_vpc_virginia.id
  }
  tags = {
    Name = "Public CRT"
  }
}


#tabla de asosciacion 
resource "aws_route_table_association" "crta_public_subnet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_crt.id
}





 resource "aws_security_group" "sg_public_instance" {
   name        = "Public Instance SG"
   description = "Allow SSH inbound traffic and ALL egress traffic"
   vpc_id      = aws_vpc.vpc_virginia.id

   ingress = [{
     description = "SSH over Internet"
     from_port = 22
     to_port = 22
     protocol = "tcp"
     cidr_blocks = [var.sg_ingress_cidr]
     ipv6_cidr_blocks = []
     prefix_list_ids = []
     security_groups = []
     self            = false
   }]
   egress =[ {
    description = " salida"
     from_port = 0
     to_port = 0
     protocol = "-1"
     cidr_blocks = ["0.0.0.0/0"]
     ipv6_cidr_blocks = ["::/0"]
     prefix_list_ids = []
     security_groups = []
     self            = false
   }]
   tags = {
     Name = "Public Instance SG"
   }
 }
