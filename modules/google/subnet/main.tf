module "vpc" {
    source  = "terraform-google-modules/network/google//modules/subnets"
    version = "~> 2.0.0"

    project_id   = var.project_id
    network_name = var.network_name

    subnets = var.subnet
    secondary_ranges = var.secondary_ranges
}