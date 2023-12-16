variable "name" {
  type        = string
  default     = "nat"
  description = "Cloud nat name"
}

variable "region_name" {
  type        = string
  default     = ""
  description = "Cloud nat region"
}

variable "router_name" {
  type    = string
  default = ""
}

variable "log_config" {
  type = object({
    enable = bool
    filter = string
  })
}
variable "source_subnetwork_ip_ranges_to_nat" {
  type    = string
  default = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}
