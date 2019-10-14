# Required
# - ElastiCache converts this name to lowercase
variable cluster_id {
  description = "(Required) Group identifier."
  type        = string
}

# Required
# - Valid values for this parameter are memcached or redis
variable engine {
  description = "(Required) Name of the cache engine to be used for this cache cluster"
  type        = string
}

# Optional
variable engine_version {
  description = "(Optional) Version number of the cache engine to be used."
  type        = string
  default     = ""
}

# Optional
# - The format is ddd:hh24:mi-ddd:hh24:mi
# Example: sun:05:00-sun:09:00
variable maintenance_window {
  description = "(Optional) Specifies the weekly time range for when maintenance on the cache cluster is performed."
  type        = string
  default     = ""
}

# Required
# Example: cache.t2.micro
variable node_type {
  description = "(Required) The compute and memory capacity of the nodes."
  type        = string
}

# Required
# - For Redis, this value must be 1.
# - For Memcache, this value must be between 1 and 20
variable num_cache_nodes {
  description = "(Required) The initial number of cache nodes that the cache cluster will have."
  type        = number
}

# Required
# Example: default.redis3.2
variable parameter_group_name {
  description = "(Required) Name of the parameter group to associate with this cache cluster."
  type        = string
}

# Optional
# - For Redis the default port is 6379
# - For Memcache the default is 11211
# - Cannot be provided with replication_group_id.
variable port {
  description = "(Optional) The port number on which each of the cache nodes will accept connections."
  type        = string
  default     = 6379
}

# Optional
# VPC only
variable subnet_group_name {
  description = "(Optional, VPC only) Name of the subnet group to be used for the cache cluster."
  type        = string
  default     = ""
}

# Optional
# EC2 Classic only
variable security_group_names {
  description = "(Optional, EC2 Classic only) List of security group names to associate with this cache cluster."
  type        = list(string)
  default     = []
}

# Optional
# VPC only
variable security_group_ids {
  description = "(Optional, VPC only) One or more VPC security groups associated with the cache cluster."
  type        = list(string)
  default     = []
}

# Optional
variable apply_immediately {
  description = "(Optional) Specifies whether any database modifications are applied immediately, or during the next maintenance window."
  type        = bool
  default     = false
}

# Optional
# Note: A single-element string list
# Example: arn:aws:s3:::my_bucket/snapshot1.rdb
variable snapshot_arns {
  description = "(Optional) A single-element string list containing an Amazon Resource Name (ARN) of a Redis RDB snapshot file stored in Amazon S3."
  type        = list(string)
  default     = []
}

# Optional
# - Changing the snapshot_name forces a new resource.
variable snapshot_name {
  description = "(Optional) The name of a snapshot from which to restore data into the new node group."
  type        = string
  default     = ""
}

# Optional
# Redis only
# Note: time is in UTC
# Example: 05:00-09:00
variable snapshot_window {
  description = "(Optional, Redis only) The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster."
  type        = string
  default     = ""
}

# Optional
# Redis only
# - If you set SnapshotRetentionLimit to 5, then a snapshot that was taken today will be retained for 5 days
#   before being deleted.
# - If the value of SnapshotRetentionLimit is set to zero (0), backups are turned off.
# - Please note that setting a snapshot_retention_limit is not supported on cache.t1.micro or cache.t2.* cache nodes
variable snapshot_retention_limit {
  description = "(Optional, Redis only) The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them."
  type        = number
  default     = 0
}

# Optional
# Example: arn:aws:sns:us-east-1:012345678999:my_sns_topic
variable notification_topic_arn {
  description = "(Optional) An Amazon Resource Name (ARN) of an SNS topic to send ElastiCache notifications to."
  type        = string
  default     = ""
}

# Optional
# Memcached only
# - Valid values for this parameter are single-az or cross-az
# - If you want to choose cross-az, num_cache_nodes must be greater than 1
variable az_mode {
  description = "(Optional, Memcached only) Specifies whether the nodes in this Memcached node group are created in a single Availability Zone or created across multiple Availability Zones in the cluster's region."
  type        = string
  default     = "single-az"
}

# Optional
# - If you want to create cache nodes in multi-az, use preferred_availability_zones instead
# Default: System chosen Availability Zone.
variable availability_zone {
  description = "(Optional) The Availability Zone for the cache cluster."
  type        = list(string)
  default     = []
}

# Optional
# Memcached only
# - If you are creating your cluster in an Amazon VPC you can only locate nodes in Availability Zones
#   that are associated with the subnets in the selected subnet group.
# - The number of Availability Zones listed must equal the value of num_cache_nodes.
# - If you want all the nodes in the same Availability Zone, use availability_zone instead,
#   or repeat the Availability Zone multiple times in the list.
# - Detecting drift of existing node availability zone is not currently supported.
# - Updating this argument by itself to migrate existing node availability zones is
#   not currently supported and will show a perpetual difference.
# Default: System chosen Availability Zones.
variable preferred_availability_zones {
  description = "(Optional, Memcached only) A list of the Availability Zones in which cache nodes are created."
  type        = list(string)
  default     = []
}

# Optional
variable tags {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}