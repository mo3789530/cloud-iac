locals {
  env = var.env

  vpc = {
    # ${env}-vpc-${region_name}
    network_name = format("%s-%s-%s", local.env.environment, "vpc", local.env.region_name)
  }

  nat = {
    # ${env}-nat-${region_name} 
    name = format("%s-%s-%s", local.env.environment, "nat", local.env.region_name)

  }
  storage = {
    app_log = var.app_log_storage

  }

  firewall = var.firefall
}
