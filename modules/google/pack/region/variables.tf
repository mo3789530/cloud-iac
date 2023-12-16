variable "env" {
  type = object({
    project_id  = string
    environment = string
    region_name = string
  })
  default = null
}

variable "app_log_storage" {
  type = map(object({
    name             = string
    location         = string
    randomize_suffix = optional(bool)
  }))
  default = {}
}


variable "firefall" {
  type = object({
    egress_rules = list(object({
      name                    = string
      description             = optional(string, null)
      disabled                = optional(bool, null)
      priority                = optional(number, null)
      destination_ranges      = optional(list(string), [])
      source_ranges           = optional(list(string), [])
      source_tags             = optional(list(string))
      source_service_accounts = optional(list(string))
      target_tags             = optional(list(string))
      target_service_accounts = optional(list(string))

      allow = optional(list(object({
        protocol = string
        ports    = optional(list(string))
      })), [])
      deny = optional(list(object({
        protocol = string
        ports    = optional(list(string))
      })), [])
      log_config = optional(object({
        metadata = string
      }))
    }))
    ingress_rules = list(object({
      name                    = string
      description             = optional(string, null)
      disabled                = optional(bool, null)
      priority                = optional(number, null)
      destination_ranges      = optional(list(string), [])
      source_ranges           = optional(list(string), [])
      source_tags             = optional(list(string))
      source_service_accounts = optional(list(string))
      target_tags             = optional(list(string))
      target_service_accounts = optional(list(string))

      allow = optional(list(object({
        protocol = string
        ports    = optional(list(string))
      })), [])
      deny = optional(list(object({
        protocol = string
        ports    = optional(list(string))
      })), [])
      log_config = optional(object({
        metadata = string
      }))
    }))
  })
  default = null

}
