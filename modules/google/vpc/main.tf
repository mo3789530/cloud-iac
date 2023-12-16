module "vpc" {
  source                                 = "terraform-google-modules/network/google//modules/vpc"
  version                                = "~> 2.0.0"
  project_id                             = var.project_id
  network_name                           = var.network_name
  shared_vpc_host                        = var.shared_vpc_host
  description                            = var.description
  routing_mode                           = var.routing_mode
  delete_default_internet_gateway_routes = var.delete_default_internet_gateway_routes
}
