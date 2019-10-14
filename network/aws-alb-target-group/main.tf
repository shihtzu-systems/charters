resource aws_lb_target_group this {
  name                 = var.name
  target_type          = "instance"
  port                 = var.port
  protocol             = var.protocol
  vpc_id               = var.vpc_id
  deregistration_delay = var.deregistration_delay
  slow_start           = var.slow_start
  stickiness           = var.stickiness
  health_check         = var.health_check
  tags                 = var.tags
}