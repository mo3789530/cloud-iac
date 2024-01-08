# modules/cloud-function/variables.tf

variable "credentials_file" {
  description = "Path to the service account key JSON file"
}

variable "location" {
  description = "Google Cloud location"
  type        = string
}

variable "project" {
  description = "Google Cloud Project ID"
}

variable "region" {
  description = "Google Cloud region"
}

variable "function_name" {
  description = "Name of the Cloud Function"
}


variable "allow_unauthenticated" {
  description = "Allow unauthenticated invocations of the function"
  default     = false
}

variable "security_level" {
  description = "Security level of function. Allowed values: SECURE_ALWAYS, SECURE_OPTIONAL"
  default     = "SECURE_ALWAYS"
}



variable "build_config" {
  type = object({
    runtime     = string
    entry_point = string
    source = object({
      storage_source = object({
        bucket = string
        object = string
      })
    })
  })
  default = null
}


variable "service_config" {
  type = object({
    available_cpu      = number
    available_memory   = number
    timeout            = string
    max_instance_count = number
    min_instance_count = number
    vpc_connector      = string
    ingress_settings   = string
    egress_settings    = string
    service_account    = string
  })
  default = {
    available_cpu      = 1
    available_memory   = 256
    timeout            = "60s"
    max_instance_count = 0
    min_instance_count = 0
    vpc_connector      = null
    ingress_settings   = "ALLOW_ALL"
    egress_settings    = "ALL_TRAFFIC"
    service_account    = null
  }

}
variable "description" {
  type        = string
  default     = "Processes events."
  description = "The description of the function."
}
