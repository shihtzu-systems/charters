locals {
  vpc_cidr    = "${var.vpc_network_address}/16"
  common_tags = map("Created", "terraform")
}

module vpc {
  source = "terraform-aws-modules/vpc/aws"

  name = var.cluster_name
  cidr = "${var.vpc_network_address}/16"

  azs = ["${var.region}a", "${var.region}b", "${var.region}c"]

  private_subnets = [
    cidrsubnet(local.vpc_cidr, 8, 1),
    cidrsubnet(local.vpc_cidr, 8, 2),
    cidrsubnet(local.vpc_cidr, 8, 3),
  ]

  private_subnet_tags = merge(
    local.common_tags,
    map(
      "kubernetes.io/role/internal-elb", "1",
      "kubernetes.io/role/alb-ingress", "1"
    )
  )

  public_subnets = [
    cidrsubnet(local.vpc_cidr, 8, 101),
    cidrsubnet(local.vpc_cidr, 8, 102),
    cidrsubnet(local.vpc_cidr, 8, 103),
  ]

  public_subnet_tags = merge(
    local.common_tags,
    map(
      "kubernetes.io/role/elb", "1",
      "kubernetes.io/role/alb-ingress", "1"
    )
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
      "kubernetes.io/cluster/${var.cluster_name}", "shared"
  ))
}

