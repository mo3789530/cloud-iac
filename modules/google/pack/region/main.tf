# VPC
module "vpc" {
  source       = "../../vpc"
  project_id   = local.env.project_id
  network_name = local.vpc.network_name
}

# application log storage 
module "storage" {
  for_each   = local.storages
  source     = "../../storage"
  project_id = local.env.project_id
  names      = each.value.name
  location   = each.value.location
  prefix     = each.value.value.location
}


module "cloudnat" {

}


module "firefall" {

}
