resource "aws_s3_bucket" "provedores" {
  count = 6
  bucket = "provedores-${random_string.sufijo[count.index].id}"
  tags = {
    Owner = "andres otero"
    Enviroment = "dev"
    Office = "provedores"

  }

}

resource "random_string" "sufijo" {
  count = 6 
  length = 8
  special = false
  upper = false
  numeric = false
}