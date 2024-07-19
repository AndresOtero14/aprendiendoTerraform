resource "local_file" "productos" {
  count = 3
  content = "lista de productos para vender  de andres otero"
  filename = "producto-${random_string.sufijo[count.index].id}.txt"
}

  