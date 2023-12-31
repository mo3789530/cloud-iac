resource "azurerm_storage_container" "this" {
  name                  = var.name
  storage_account_name  = var.name
  container_access_type = var.container_access_type
}


variable "name" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "container_access_type" {
  type = string
  default = "private"
  description = ""
}