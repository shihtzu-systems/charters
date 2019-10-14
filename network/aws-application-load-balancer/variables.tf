# Optional
# - This name must be unique within your AWS account
# - Can have a maximum of 32 characters
# - Must contain only alphanumeric characters or hyphens
# - Must not begin or end with a hyphen.
# - If not specified, Terraform will autogenerate a name beginning with tf-lb.
variable name {
  description = "(Optional) The name of the LB."
  type        = string
  default     = ""
}

# Optional
variable internal {
  description = "(Optional) If true, the LB will be internal."
  type        = bool
  default     = false
}

# Optional
variable security_groups {
  description = "(Optional) A list of security group IDs to assign to the LB."
  type        = list(string)
  default     = []
}

# Optional
variable access_logs {
  description = "(Optional) An Access Logs block."
  type = object({

    # Required
    # - The S3 bucket name to store the logs in.
    bucket = string

    # Optional
    # - The S3 bucket prefix.
    # - Logs are stored in the root if not configured.
    prefix = string

    # Optional
    # - Boolean to enable / disable access_logs.
    # - Defaults to false, even when bucket is specified.
    enabled = bool
  })
  default = {}
}

# Optional
# - Subnets cannot be updated for Load Balancers of type network.
# - Changing this value for load balancers of type network will force a recreation of the resource.
variable subnets {
  description = "(Optional) A list of subnet IDs to attach to the LB"
  type        = list(string)
  default     = []
}

# Optional
variable subnet_mapping {
  description = "(Optional) A subnet mapping block as documented below."
  type = object({

    # Required
    # - The id of the subnet of which to attach to the load balancer.
    # - You can specify only one subnet per Availability Zone.
    subnet_id = string

    # Optional
    # - The allocation ID of the Elastic IP address.
    allocation_id = string
  })
  default = {}
}

# Optional
variable idle_timeout {
  description = "(Optional) The time in seconds that the connection is allowed to be idle."
  type        = number
  default     = 60
}

# Optional
# - This will prevent Terraform from deleting the load balancer.
variable enable_deletion_protection {
  description = "(Optional) If true, deletion of the load balancer will be disabled via the AWS API."
  type        = bool
  default     = false
}

# Optional
variable enable_http2 {
  description = "(Optional) Indicates whether HTTP/2 is enabled in application load balancers."
  type        = bool
  default     = true
}

# Optional
# - The possible values are ipv4 and dualstack
variable ip_address_type {
  description = "(Optional) The type of IP addresses used by the subnets for your load balancer."
  type        = string
  default     = ""
}

# Optional
variable tags {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
