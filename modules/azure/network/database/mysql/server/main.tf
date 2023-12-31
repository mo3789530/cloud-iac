resource "azurerm_mysql_server" "this" {
 name  = format("%s-%s", var.name, "server")
 location = var.location
 resource_group_name = var.resource_group_name
 sku_name = var.sku_name
 version = var.version
 backup_retention_days = var.backup_retention_days
 administrator_login_password = random_string.azurerm_mysql_server
 public_network_access_enabled = false
 ssl_enforcement_enabled = true
 ssl_minimal_tls_version_enforced = "TLS1_2"
 storage_mb = var.storage_mb

 tags = tags
 depends_on = [ random_string.azurerm_mysql_server ]
}

resource "random_string" "azurerm_mysql_server" {
  length = 16
  special = true
}

# resource "azurerm_mysql_database" "this" {
#     name = format("%s-%s", var.name, "db")
# }

variable "name" {
  
}

variable "resource_group_name" {
  
}

variable "location" {
  
}

variable "sku_name" {
  
}

variable "version" {
  default = "8.0"
}

variable "backup_retention_days" {
  type = number
}

variable "storage_mb" {
    type = number
  default = 5120 # 5GB
}

variable "tags" {
  
}