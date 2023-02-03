resource "aws_route_table" "route_table_public_subnets" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    "Name" = "${var.projeto}-rt-public-subnet"
  }  
}

resource "aws_route_table_association" "table_association_public_a" {
  subnet_id      = aws_subnet.subnet_public_a.id
  route_table_id = aws_route_table.route_table_public_subnets.id
}

resource "aws_route_table_association" "table_association_public_c" {
  subnet_id      = aws_subnet.subnet_public_c.id
  route_table_id = aws_route_table.route_table_public_subnets.id
}