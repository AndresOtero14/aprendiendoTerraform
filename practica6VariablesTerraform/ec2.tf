resource "aws_instance" "public_instance" {
  ami                     = "ami-0b72821e2f351e396"
  instance_type           = "t2.micro"
  subnet_id = aws_subnet.public_subnet.id
  key_name = data.aws_key_pair.developer_key.key_name
}