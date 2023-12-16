locals {
  env = var.env
  vpc = {
    # ${env}-vpc-${region_name}
    network_name = format("%s-%s-%s", local.env.environment, "vpc", local.env.region_name)
  }
  storages = var.storages
}
