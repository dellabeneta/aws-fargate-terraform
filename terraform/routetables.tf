resource "aws_route_table" "route_table_public_subnet" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    "Name" = "${var.projeto}-rt-public-subnet"
  }  
}

resource "aws_route_table_association" "association_public_a" {
  subnet_id      = aws_subnet.subnet_public_a.id
  route_table_id = aws_route_table.route_table_public_subnet.id
}

resource "aws_route_table_association" "association_public_b" {
  subnet_id      = aws_subnet.subnet_public_b.id
  route_table_id = aws_route_table.route_table_public_subnet.id
}



resource "aws_route_table" "route_table_private_subnet_a" {
  vpc_id = aws_vpc.vpc.id

    tags = {
    "Name" = "${var.projeto}-rt-private-subnet-a"
  }  
}

resource "aws_route_table_association" "association_private_a" {
  subnet_id      = aws_subnet.subnet_private_a.id
  route_table_id = aws_route_table.route_table_private_subnet_a.id
}

resource "aws_route_table" "route_table_private_subnet_b" {
  vpc_id = aws_vpc.vpc.id

    tags = {
    "Name" = "${var.projeto}-rt-private-subnet-b"
  }  
}

resource "aws_route_table_association" "association_private_b" {
  subnet_id      = aws_subnet.subnet_private_b.id
  route_table_id = aws_route_table.route_table_private_subnet_b.id
}