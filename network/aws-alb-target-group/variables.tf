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
variable stickiness {
  description = "(Required) A Stickiness block."
  type = object({

    # Required
    # - The type of sticky sessions.
    # - The only current possible value is lb_cookie.
    type = string

    # Optional
    # - The time period, in seconds, during which requests from a client should be routed to the same target.
    # - After this time period expires, the load balancer-generated cookie is considered stale.
    # - The range is 1 second to 1 week (604800 seconds).
    # - The default value is 1 day (86400 seconds).
    cookie_duration = string

    # Optional
    # - Boolean to enable / disable stickiness
    # - Default is true
    enabled = bool
  })
}

# Required
variable health_check {
  description = "(Required) A Health Check block."
  type = object({
    # Required
    # - The HTTP codes to use when checking for a successful response from a target.
    # - You can specify multiple values (for example, "200,202") or a range of values (for example, "200-299"
    matcher = string

    # Required
    # - The destination for the health check request.
    path = string

    # Optional
    # - Indicates whether health checks are enabled.
    # - Defaults to true.
    enabled = bool

    # Optional
    # - The approximate amount of time, in seconds, between health checks of an individual target.
    # - Minimum value 5 seconds
    # - Maximum value 300 seconds
    # - Default 30 seconds
    interval = number

    # Optional
    # - Valid values are either ports 1-65536, or traffic-port.
    # - Defaults to traffic-port
    port = number

    # Optional
    # - The protocol to use to connect with the target.
    # - Valid values are either HTTP or HTTPS
    # - Defaults to HTTP.
    protocol = string

    # Optional
    # - The amount of time, in seconds, during which no response means a failed health check.
    # - The range is 2 to 120 seconds
    # - Defaults to 5 seconds
    timeout = number

    # Optional
    # - The number of consecutive health checks successes required before considering an unhealthy target healthy.
    # - Defaults to 3
    healthy_threshold = number

    # Optional
    # - The number of consecutive health check failures required before considering the target unhealthy.
    # - Defaults to 3
    unhealthy_threshold = number
  })
}

# Optional
variable tags {
  description = "(Optional) A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}