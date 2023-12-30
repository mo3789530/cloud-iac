# modules/virtual-network/variables.tf

variable "virtual_network_name" {
  description = "Name of the Azure Virtual Network"
}

variable "address_space" {
  description = "Address space of the Virtual Network"
  type        = list(string)
}

variable "location" {
  description = "Azure region where the Virtual Network will be created"
}

variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
}

variable "tags" {
  description = "Tags to apply to the Azure Virtual Network"
  type        = map(string)
}