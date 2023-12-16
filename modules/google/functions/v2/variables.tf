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

variable "runtime" {
  description = "Runtime for the Cloud Function (e.g., nodejs14)"
}

variable "source_bucket" {
  description = "Google Cloud Storage bucket containing the Cloud Function code"
}

variable "source_object" {
  description = "Object path in the source bucket containing the Cloud Function code"
}

variable "entry_point" {
  description = "Name of the function (must be defined in the source code)"
}

variable "memory" {
  description = "Amount of memory to allocate to the Cloud Function"
  default     = 256
}

variable "timeout" {
  description = "Timeout for the Cloud Function in seconds"
  default     = 60
}

variable "allow_unauthenticated" {
  description = "Allow unauthenticated invocations of the function"
  default     = false
}

variable "security_level" {
  description = "Security level of function. Allowed values: SECURE_ALWAYS, SECURE_OPTIONAL"
  default     = "SECURE_ALWAYS"
}
