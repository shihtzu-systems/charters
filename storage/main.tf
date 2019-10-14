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

module redis {
  source = "./aws-elasticache/redis"

  cluster_id = var.storage.redis_name
  node_type = "cache.t2.micro"

  tags = local.common_tags
}