resource "aws_subnet" "subnet_public_a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-west-1a"

  tags = {
    "Name" = "${var.projeto}-public-a"
  }
}

resource "aws_subnet" "subnet_public_c" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-west-1c"

  tags = {
    "Name" = "${var.projeto}-public-c"
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

resource "aws_subnet" "subnet_private_c" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-west-1c"

  tags = {
    "Name" = "${var.projeto}-private-c"
  }
}
