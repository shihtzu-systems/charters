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
  source = "aws-application-load-balancer"

  name            = var.network.name
  subnets         = var.subnet_ids
  security_groups = [module.http_all.this_security_group_id, module.https_all.this_security_group_id]

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
    zone_id                = module.alb.zone_id
    evaluate_target_health = true
  }
}