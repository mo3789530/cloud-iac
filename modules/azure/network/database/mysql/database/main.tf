resource "azurerm_mysql_database" "this" {
  name                = format("%s-%s", name, "db")
  resource_group_name = var.resource_group_name
  server_name         = var.server_name
  charset             = "utf8"
  collation           = "utf8mb4_general_ci"

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}

variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "server_name" {
  type = string
}