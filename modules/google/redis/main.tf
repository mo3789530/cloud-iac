module "memorystore" {
  source  = "terraform-google-modules/memorystore/google"
  version = "~> 7.1.0"

  name                    = var.name
  project                 = var.project_id
  display_name            = var.display_name
  memory_size_gb          = var.memory_size_gb
  connect_mode            = var.connect_mode
  tier                    = var.tier
  region                  = var.region
  redis_version           = var.redis_version
  location_id             = var.location_id
  alternative_location_id = var.alternative_location_id
  redis_configs           = var.redis_configs
  read_replicas_mode      = var.read_replicas_mode
  maintenance_policy      = var.maintenance_policy
  customer_managed_key    = var.customer_managed_key
  persistence_config      = var.persistence_config
  authorized_network      = var.authorized_network
  enable_apis             = var.enable_apis
  transit_encryption_mode = var.transit_encryption_mode
}


output "read_endpoint" {
  value = module.memorystore.read_endpoint
}

output "id" {
  value = module.memorystore.id
}

output "host" {
  value = module.memorystore.host
}
