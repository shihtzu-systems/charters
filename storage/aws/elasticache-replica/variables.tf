# Required
# - ElastiCache converts this name to lowercase
variable cluster_id {
  description = "(Required) Group identifier."
  type        = string
}

# Optional
variable replication_group_id {
  description = "(Optional) The ID of the replication group to which this cluster should belong."
  type        = string
  default     = ""
}

# Optional
variable tags {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}