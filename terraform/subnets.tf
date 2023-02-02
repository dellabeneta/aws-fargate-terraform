resource "aws_subnet" "subnet_public_a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-west-1a"

  tags = {
    "Name" = "${var.projeto}-public-a"
  }
}

resource "aws_subnet" "subnet_public_b" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-west-1c"

  tags = {
    "Name" = "${var.projeto}-public-b"
  }
}

resource "aws_subnet" "subnet_private_a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-west-1a"

  tags = {
    "Name" = "${var.projeto}-private-a"
  }
}

resource "aws_subnet" "subnet_private_b" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-west-1c"

  tags = {
    "Name" = "${var.projeto}-private-b"
  }
}
