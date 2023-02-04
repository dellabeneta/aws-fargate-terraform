resource "aws_eip" "eip_a" {
  vpc = true
}

resource "aws_eip" "eip_c" {
  vpc = true
}