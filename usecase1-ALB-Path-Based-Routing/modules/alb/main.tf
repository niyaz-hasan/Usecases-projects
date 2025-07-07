resource "aws_lb" "this" {
  name               = "alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_groups
  subnets            = var.subnets
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.this.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = var.tg_arns[0]
  }
}

resource "aws_lb_listener_rule" "image" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 10

  action {
    type             = "forward"
    target_group_arn = var.tg_arns[1]  # Assume tg_a
  }

  condition {
    path_pattern {
      values = ["/images*"]
    }
  }
}

resource "aws_lb_listener_rule" "register" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 20

  action {
    type             = "forward"
    target_group_arn = var.tg_arns[2]  # Assume tg_b
  }

  condition {
    path_pattern {
      values = ["/register*"]
    }
  }
}


output "alb_dns_name" {
  value = aws_lb.this.dns_name
}
