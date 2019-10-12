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
