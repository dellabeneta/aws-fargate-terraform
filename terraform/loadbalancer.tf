resource "aws_lb" "lb" {
  name               = "doguinho-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.security_group_lb.id]
  subnets            = [aws_subnet.subnet_public_a.id, aws_subnet.subnet_public_c.id]
}

resource "aws_lb_target_group" "target_group" {
  name                          = "doguinho-tg"
  port                          = 80
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  target_type                   = "ip"
  vpc_id                        = aws_vpc.vpc.id
  load_balancing_algorithm_type = "round_robin"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/healthcheck"
    port                = "traffic-port"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    protocol            = "HTTP"
    matcher             = "200-204"
  }
}

resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "80"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}