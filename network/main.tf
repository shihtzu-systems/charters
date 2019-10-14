locals {
  common_tags = {
    Created = "terraform"
  }
}

data aws_acm_certificate this {
  domain      = var.network.cert_domain
  types       = ["AMAZON_ISSUED"]
  most_recent = true
}

module http_all {
  source  = "terraform-aws-modules/security-group/aws//modules/http-80"
  version = "3.1.0"

  name                = "${var.network.name}-http-all-traffic"
  vpc_id              = var.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]

  tags = local.common_tags
}

module https_all {
  source  = "terraform-aws-modules/security-group/aws//modules/https-443"
  version = "3.1.0"

  name                = "${var.network.name}-https-all-traffic"
  vpc_id              = var.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]

  tags = local.common_tags
}

module alb {
  source  = "terraform-aws-modules/alb/aws"
  version = "4.1.0"

  load_balancer_name = var.network.name
  security_groups    = [module.http_all.this_security_group_id, module.https_all.this_security_group_id]
  vpc_id             = var.vpc_id
  subnets            = var.subnet_ids

  logging_enabled = false

  https_listeners = [
    {
      certificate_arn = data.aws_acm_certificate.this.arn
      port            = 443
    }
  ]
  https_listeners_count = "1"

  target_groups = [
    {
      name             = var.network.name
      backend_protocol = "HTTP"
      backend_port     = var.network.backend_port
    }
  ]
  target_groups_count = "1"

  tags = local.common_tags
}

data aws_route53_zone this {
  name         = var.network.domain
  private_zone = false
}

resource aws_route53_record this {
  zone_id = data.aws_route53_zone.this.id
  name    = "${var.network.subdomain}.${var.network.domain}"
  type    = "A"

  alias {
    name                   = module.alb.dns_name
    zone_id                = module.alb.load_balancer_zone_id
    evaluate_target_health = true
  }
}