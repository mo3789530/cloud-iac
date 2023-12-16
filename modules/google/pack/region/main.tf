# VPC
module "vpc" {
  source       = "../../vpc"
  project_id   = local.env.project_id
  network_name = local.vpc.network_name
}

# application log storage 
module "storage-app-log" {
  source     = "../../storage"
  project_id = local.env.project_id
  names      = local.storages.app_log.names
  location   = local.storages.app_log.location
  prefix     = local.storages.app_log.location
}

# Cloud NAT
module "cloudnat" {
  source      = "../../nat"
  name        = local.nat.name
  region_name = local.env.region_name
  router_name = local.vpc.router_name
  log_config  = local.vpc.log_config

  depends_on = [module.vpc]
}

# firewall
module "firefall" {
  source        = "../../firewall-rule"
  project_id    = local.env.project_id
  network_name  = local.vpc.network_name
  egress_rules  = local.firewall.egress_rules
  ingress_rules = local.firewall.ingress_rules
  depends_on    = [module.vpc]
}
