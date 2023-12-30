# modules/subnet/variables.tf

variable "subnet_name" {
  description = "Name of the Azure Subnet"
}

variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
}

variable "virtual_network_name" {
  description = "Name of the Azure Virtual Network"
}

variable "subnet_address_prefix" {
  description = "Address prefix of the Subnet"
}

variable "security_group_id" {
  description = "ID of the associated Network Security Group"
}

variable "network_interface_ids" {
  description = "List of Network Interface IDs associated with the Subnet"
  type        = list(string)
}


variable "private_endpoint_network_policies_enabled" {
  type    = bool
  default = true
}

variable "private_link_service_network_policies_enabled" {
  type    = bool
  default = true
}

variable "delegation" {
  type = any
}