resource aws_lb_target_group this {
  name                 = var.name
  target_type          = "instance"
  port                 = var.port
  protocol             = var.protocol
  vpc_id               = var.vpc_id
  deregistration_delay = var.deregistration_delay
  slow_start           = var.slow_start
  stickiness {
    enabled         = var.stickiness_enabled
    type            = "lb_cookie"
    cookie_duration = var.stickiness_cookie_duration
  }
  health_check {
    enabled             = var.health_check_enabled
    matcher             = var.health_check_matcher
    path                = var.health_check_path
    interval            = var.health_check_interval
    port                = var.health_check_port
    protocol            = var.health_check_protocol
    timeout             = var.health_check_timeout
    healthy_threshold   = var.health_check_healthy_threshold
    unhealthy_threshold = var.health_check_unhealthy_threshold
  }
  tags = var.tags
}