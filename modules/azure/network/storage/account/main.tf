resource "azurerm_storage_account" "this" {
  name = var.name
  resource_group_name = var.name
  location = var.location
  account_tier = var.access_tier
  access_tier = var.access_tier

  account_kind = var.account_kind
  account_replication_type = var.account_replication_type

  enable_https_traffic_only = true
  min_tls_version = "TLS1_2"
  allow_nested_items_to_be_public = false
  
}

variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type =string
}

variable "account_tier" {
  
}

variable "access_tier" {
  type = string
  default = "Standard"
}

variable "account_kind" {
  
}

variable "account_replication_type" {
  
}