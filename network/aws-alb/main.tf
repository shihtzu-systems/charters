resource aws_lb this {
  name               = var.name
  internal           = var.internal
  load_balancer_type = "application"
  security_groups    = var.security_groups
  access_logs {
    enabled = var.access_logs_enabled
    bucket  = var.access_logs_bucket
    prefix  = var.access_logs_prefix
  }
  subnets                    = var.subnets
  idle_timeout               = var.idle_timeout
  enable_deletion_protection = var.enable_deletion_protection
  enable_http2               = var.enable_http2
  ip_address_type            = var.ip_address_type
  tags                       = var.tags
}