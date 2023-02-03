resource "aws_security_group" "security_group_cluster" {
  name = "doguinho-sg-cluster"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port        = 3000
    to_port          = 3000
    protocol         = "tcp"
    security_groups = [aws_security_group.security_group_lb.id]
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "${var.projeto}-sg-cluster"
  }
}