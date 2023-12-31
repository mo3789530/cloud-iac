resource "azurerm_storage_table" "this" {
  name                 = var.name
  storage_account_name = var.storage_account_name

  dynamic "acl" {
    for_each = var.acl
    content {
      id = var.acl.id
    }
  }
}

variable "name" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "acl" {
  type = object({
    id = string
  })
  default = null
}
