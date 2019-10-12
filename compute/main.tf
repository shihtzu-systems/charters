locals {
  vpc_cidr    = "${var.compute.network_address}/16"
  common_tags = {
    Created = "terraform"
  }
  internal_lb_tags = {
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/role/alb-ingress" = "1"
  }
  public_lb_tags = {
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/role/alb-ingress" = "1"
  }
}

data aws_availability_zones this {
  state = "available"
}

module vpc {
  source = "terraform-aws-modules/vpc/aws"

  name = var.compute.name
  cidr = local.vpc_cidr

  azs = [
    data.aws_availability_zones.this.names[0],
    data.aws_availability_zones.this.names[1],
    data.aws_availability_zones.this.names[2]
  ]

  private_subnets = [
    cidrsubnet(local.vpc_cidr, 8, 1),
    cidrsubnet(local.vpc_cidr, 8, 2),
    cidrsubnet(local.vpc_cidr, 8, 3),
  ]

  private_subnet_tags = merge(
    local.common_tags,
    local.internal_lb_tags,
  )

  public_subnets = [
    cidrsubnet(local.vpc_cidr, 8, 101),
    cidrsubnet(local.vpc_cidr, 8, 102),
    cidrsubnet(local.vpc_cidr, 8, 103),
  ]

  public_subnet_tags = merge(
    local.common_tags,
    local.public_lb_tags,
  )

  database_subnets = [
    cidrsubnet(local.vpc_cidr, 8, 201),
    cidrsubnet(local.vpc_cidr, 8, 202),
    cidrsubnet(local.vpc_cidr, 8, 203),
  ]

  database_subnet_tags = merge(
    local.common_tags
  )

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  tags = merge(
    local.common_tags,
    map(
      "kubernetes.io/cluster/${var.compute.name}", "shared"
  ))
}

