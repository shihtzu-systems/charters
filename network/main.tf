locals {
  common_tags = map("Created", "terraform")
}

module http_all {
  source  = "terraform-aws-modules/security-group/aws//modules/http-80"
  version = "3.1.0"

  name                = "${var.name}-http-all-traffic"
  description         = "Security group for web-server with HTTP ports open within VPC"
  vpc_id              = var.vpc.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]

  tags = local.common_tags
}

module https_all {
  source  = "terraform-aws-modules/security-group/aws//modules/https-443"
  version = "3.1.0"

  name                = "${var.name}-https-all-traffic"
  description         = "Security group for web-server with HTTPS ports open within VPC"
  vpc_id              = var.vpc.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]

  tags = local.common_tags
}

module alb {
  source  = "terraform-aws-modules/alb/aws"
  version = "4.1.0"

  load_balancer_name = var.name
  security_groups    = [module.http_all.this_security_group_id, module.https_all.this_security_group_id]
  vpc_id             = var.vpc.vpc_id
  subnets            = var.vpc.public_subnet_ids

  logging_enabled = false

  https_listeners = [
    {
      certificate_arn = var.cert_arn
      port            = 443
    }
  ]
  https_listeners_count = "1"

  http_tcp_listeners = [
    {
      protocol = "HTTP"
      port     = "80"
    }
  ]
  http_tcp_listeners_count = "1"

  target_groups = [
    {
      name             = var.name
      backend_protocol = "HTTP"
      backend_port     = var.backend_port
    }
  ]
  target_groups_count = "1"

  tags = local.common_tags
}