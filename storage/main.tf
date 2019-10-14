locals {
  common_tags = {
    Created = "terraform"
  }
}

module bucket {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "1.0.0"

  bucket = var.storage.bucket_name
  acl    = "private"

  tags = local.common_tags
}

module redis_internal {
  source  = "terraform-aws-modules/security-group/aws//modules/redis"
  version = "3.1.0"

  name                = "${var.storage.name}-redis-internal-traffic"
  vpc_id              = var.vpc_id
  ingress_cidr_blocks = ["${var.compute.network_address}/16"]

  tags = local.common_tags
}

module redis {
  source = "./aws-elasticache/redis"

  cluster_id         = var.storage.redis_name
  node_type          = var.storage.redis_node_type
  subnet_group_name  = var.redis_subnet_group_name
  security_group_ids = [module.redis_internal.this_security_group_id]

  tags = local.common_tags
}