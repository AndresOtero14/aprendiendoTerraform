# Data solamente sirve para leer recursos que ya estan creados 
data "aws_key_pair" "developer_key" {
    key_name = "mykey"
}