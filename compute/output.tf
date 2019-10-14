
output vpc_id {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output public_subnet_ids {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

output elasticache_subnet_group_name {
  description = "Name of elasticache subnet group"
  value       = module.vpc.elasticache_subnet_group_name
}