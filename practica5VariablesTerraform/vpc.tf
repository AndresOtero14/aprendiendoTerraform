resource "aws_vpc" "vpc_virginia" {
  cidr_block = var.virginia_cidr  # aqui se llama la variables
  tags = {
    Name = "VPC_VIRGINIA"
    env = "dev"
  }
}

resource "aws_vpc" "vpc_ohio" {
  cidr_block = var.ohio_cidr# aqui se llama la variables
  tags = {
    Name = "VPC_OHIO"
    env = "dev"
  }
  provider = aws.ohio
}
