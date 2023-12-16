
variable "workload_identity_pool_id" {
  type        = string
  default     = ""
  description = ""
}

variable "display_name" {
  type        = string
  default     = ""
  description = ""
}
variable "description" {
  type        = string
  default     = ""
  description = ""
}

variable "disabled" {
  type        = bool
  default     = false
  description = ""
}

variable "workload_identity_pool_provider_id" {
  type        = string
  default     = ""
  description = ""
}

variable "attribute_condition" {
  type        = any
  default     = ""
  description = ""
}


variable "external_account_id" {
  type = string
  default = ""
  description = ""
}

variable "attribute_mapping" {
  type = any
  default = null
}
