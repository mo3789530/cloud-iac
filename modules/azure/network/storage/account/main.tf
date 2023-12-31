resource "azurerm_storage_account" "this" {
  name                = var.name
  resource_group_name = var.name
  location            = var.location
  account_tier        = var.access_tier
  access_tier         = var.access_tier

  account_kind             = var.account_kind
  account_replication_type = var.account_replication_type

  enable_https_traffic_only       = true
  min_tls_version                 = "TLS1_2"
  allow_nested_items_to_be_public = false
  nfsv3_enabled                   = false
  dynamic "custom_domain" {
    for_each = var.custom_domain
    content {
      name          = var.custom_domain.name
      use_subdomain = var.custom_domain.name.use_subdomain
    }
  }

  dynamic "blob_properties" {
    for_each = var.blob_properties
    content {
      dynamic "cors_rule" {
        for_each = var.blob_properties.cors_rule
        content {
          allowed_headers    = var.blob_properties.cors_rule.allowed_headers
          allowed_methods    = var.blob_properties.cors_rule.allowed_methods
          allowed_origins    = var.blob_properties.cors_rule.allowed_origins
          exposed_headers    = var.blob_properties.cors_rule.exposed_headers
          max_age_in_seconds = var.blob_properties.cors_rule.max_age_in_seconds
        }
      }
      dynamic "delete_retention_policy" {
        for_each = var.blob_properties.delete_retention_policy
        content {
          days = try(var.blob_properties.delete_retention_policy.days, 7)
        }
      }

      dynamic "restore_policy" {
        for_each = var.blob_properties.restore_policy
        content {
          days = var.blob_properties.restore_policy.days
        }
      }

    }
  }

  dynamic "network_rules" {
    for_each = var.network_rules
    content {
      default_action             = var.network_rules.default_action
      bypass                     = var.network_rules.bypass
      ip_rules                   = var.network_rules.ip_rules
      virtual_network_subnet_ids = var.network_rules.virtual_network_subnet_ids

      dynamic "private_link_access" {
        for_each = var.network_rules.private_link_access
        content {
          endpoint_tenant_id   = var.network_rules.private_link_access.endpoint_tenant_id
          endpoint_resource_id = var.network_rules.private_link_access.endpoint_resource_id
        }
      }
    }
  }

  tags = var.tags
}

variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "account_tier" {
  type = string
}

variable "access_tier" {
  type    = string
  default = "Standard"
}

variable "account_kind" {
  type = string
}

variable "account_replication_type" {
  type = string
}

variable "tags" {
  type = any
}

variable "custom_domain" {
  type = object({
    name          = string
    use_subdomain = string
  })
  default = null
}

variable "blob_properties" {
  type = list(object({
    cors_rule = list(object({
      allowed_headers    = list(string)
      allowed_methods    = list(string)
      allowed_origins    = list(string)
      exposed_headers    = list(string)
      max_age_in_seconds = number
    }))

    delete_retention_policy = list(object({
      days = number
    }))

    restore_policy = list(object({
      days = number
    }))
  }))
  default = []
}

variable "network_rules" {
  type = list(object({
    default_action             = string
    bypass                     = string
    ip_rules                   = list(string)
    virtual_network_subnet_ids = list(string)

    private_link_access = list(object({
      endpoint_tenant_id   = string
      endpoint_resource_id = string
    }))
  }))
  default = []
}
