variable "create_pbr_route_entry" {
  description = "Whether to create resources in module."
  type        = bool
  default     = false
}

variable "vpn_gateway_id" {
  description = "The ID of the vpn gateway"
  type        = string
  default     = null
}

variable "next_hop" {
  description = "The next hop of the policy-based route."
  type        = string
  default     = null
}

variable "route_dest" {
  description = "The destination CIDR block of the policy-based route."
  type        = string
  default     = null
}

variable "route_source" {
  description = "The source CIDR block of the policy-based route."
  type        = string
  default     = null
}

variable "weight" {
  description = " The weight of the policy-based route. Valid values: 0 and 100."
  type        = string
  default     = 0
}

variable "publish_vpc" {
  description = "Whether to issue the destination route to the VPC."
  type        = bool
  default     = false
}