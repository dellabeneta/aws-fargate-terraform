resource "aws_nat_gateway" "ngw_a" {
  allocation_id = aws_eip.eip_a.id
  subnet_id     = aws_subnet.subnet_public_a.id

  tags = {
    "Name" = "${var.projeto}-ngw-az-a"
  }

  depends_on = [aws_internet_gateway.igw]
}

resource "aws_nat_gateway" "ngw_c" {
  allocation_id = aws_eip.eip_c.id
  subnet_id     = aws_subnet.subnet_public_c.id

  tags = {
    "Name" = "${var.projeto}-ngw-az-c"
  }

  depends_on = [aws_internet_gateway.igw]
}