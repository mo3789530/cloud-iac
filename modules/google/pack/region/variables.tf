variable "env" {
  type = object({
    project_id  = string
    environment = string
    region_name = string
  })
  default = null
}

variable "storages" {
  type = map(object({
    name             = string
    location         = string
    randomize_suffix = optional(bool)
  }))
  default = null
}
