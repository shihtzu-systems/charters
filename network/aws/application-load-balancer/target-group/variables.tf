# Optional, Forces new resource
# - If omitted, Terraform will assign a random, unique name.
variable name {
  description = "(Optional, Forces new resource) The name of the target group."
  type        = string
  default     = ""
}

# Required, Forces new resource
variable port {
  description = "(Required) The port on which targets receive traffic, unless overridden when registering a specific target."
  type        = number
}

# Optional, Forces new resource
# - Should be one of "HTTP" or "HTTPS".
variable protocol {
  description = "(Required) The protocol to use for routing traffic to the targets."
  type        = string
}

# Required
variable vpc_id {
  description = "(Required) The identifier of the VPC in which to create the target group."
  type        = string
}

# Optional
# - The range is 0-3600 seconds.
variable deregistration_delay {
  description = "(Optional) The amount time for Elastic Load Balancing to wait before changing the state of a deregistering target from draining to unused."
  type        = number
  default     = 300
}

# Optional
# - The range is 30-900 seconds or 0 to disable.
variable slow_start {
  description = "(Optional) The amount time for targets to warm up before the load balancer sends them a full share of requests."
  type        = number
  default     = 0
}

# Required
variable stickiness_enabled {
  description = "(Required) Boolean to enable / disable stickiness."
  type        = bool
}

# Optional
# - After this time period expires, the load balancer-generated cookie is considered stale.
# - The range is 1 second to 1 week (604800 seconds).
# - The default value is 1 day (86400 seconds).
variable stickiness_cookie_duration {
  description = "(Optional) After this time period expires, the load balancer-generated cookie is considered stale."
  type        = string
  default     = "86400"
}

# Required
variable health_check_enabled {
  description = "(Required) Indicates whether health checks are enabled."
  type        = bool
}

# Optional
# - You can specify multiple values (for example, "200,202") or a range of values (for example, "200-299")
variable health_check_matcher {
  description = "(Optional) The HTTP codes to use when checking for a successful response from a target."
  type        = string
  default     = "200"
}

# Optional
variable health_check_path {
  description = "(Optional) The destination for the health check request."
  type        = string
  default     = "/health"
}


# Optional
# - Minimum value 5 seconds
# - Maximum value 300 seconds
variable health_check_interval {
  description = "(Optional) The approximate amount of time, in seconds, between health checks of an individual target."
  type        = number
  default     = 30
}

# Optional
# - Valid values are either ports 1-65536, or traffic-port.
variable health_check_port {
  description = "(Optional) The port to use to connect with the target."
  type        = string
  default     = "traffic-port"
}

# Optional
# - Valid values are either HTTP or HTTPS
variable health_check_protocol {
  description = "(Optional) The protocol to use to connect with the target."
  type        = string
  default     = "HTTP"
}
# Optional
# - The range is 2 to 120 seconds
variable health_check_timeout {
  description = "(Optional) The amount of time, in seconds, during which no response means a failed health check."
  type        = number
  default     = 5
}

# Optional
variable health_check_healthy_threshold {
  description = "(Optional) The number of consecutive health checks successes required before considering an unhealthy target healthy."
  type        = number
  default     = 3
}

# Optional
variable health_check_unhealthy_threshold {
  description = "(Optional) The number of consecutive health check failures required before considering the target unhealthy."
  type        = number
  default     = 3
}

# Optional
variable tags {
  description = "(Optional) A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}