output bucket_id {
  description = "The name of the bucket."
  value       = module.bucket.this_s3_bucket_id
}

output bucket_arn {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value       = module.bucket.his_s3_bucket_arn
}

output bucket_domain_name {
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
  value       = module.bucket.this_s3_bucket_bucket_domain_name
}

output bucket_website_domain {
  description = "The domain of the website endpoint, if the bucket is configured with a website. If not, this will be an empty string. This is used to create Route 53 alias records."
  value       = module.bucket.this_s3_bucket_website_domain
}

output bucket_website_endpoint {
  description = "The website endpoint, if the bucket is configured with a website. If not, this will be an empty string."
  value       = module.bucket.this_s3_bucket_website_endpoint
}

