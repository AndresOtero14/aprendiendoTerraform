resource "aws_vpc" "vpc_virginia" {
  cidr_block = var.virginia_cidr  # aqui se llama la variables
   tags = {
    "Name" = "vpc_virginia-${local.sufix}"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.vpc_virginia.id
  cidr_block = var.subnets[0]
  map_public_ip_on_launch = true  ## asigna direcciones id publicas -- por defecto van en false
  tags = {
    "Name" = "public subnet-${local.sufix}"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.vpc_virginia.id
  cidr_block = var.subnets[1]
  tags = {
    "Name" = "private subnet-${local.sufix}"
  }
}

resource "aws_internet_gateway" "igw_vpc_virginia" {
  vpc_id = aws_vpc.vpc_virginia.id
  tags = {
    Name = "igw vpc virginia-${local.sufix}"
  }
}




resource "aws_route_table" "public_crt" {
  vpc_id = aws_vpc.vpc_virginia.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_vpc_virginia.id
  }
  tags = {
    Name = "Public CRT-${local.sufix}"
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

   dynamic "ingress" {
     for_each = var.ingress_puertos_list
     content {
       from_port = ingress.value
       to_port = ingress.value
       protocol = "tcp"
       cidr_blocks = [var.sg_ingress_cidr]

     }
   }
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
     Name = "Public Instance SG-${local.sufix}"
   }
 }


module "mybucket" {
  source = "./modules/s3"
  bucket_name = "nombre-unico-123456"
}

output "s3_arn" {
  value = module.mybucket.s3_bucket_arn
}


module "terraform_state_backend" {
     source = "cloudposse/tfstate-backend/aws"
     # Cloud Posse recommends pinning every module to a specific version
     version     = "1.4.1"
     namespace  = "example12367"
     stage      = "prod"
     name       = "terraform"
     environment = "us-east-1"
     attributes = ["state"]

     terraform_backend_config_file_path = "."
     terraform_backend_config_file_name = "backend.tf"
     force_destroy                      = false
   }
