resource "google_compute_router_nat" "this" {
  name                   = var.name
  router                 = var.router_name
  region                 = var.region_name
  nat_ip_allocate_option = "AUTO_ONLY"
  log_config {
    enable = var.log_config.enable
    filter = var.log_config.filter
  }

  source_subnetwork_ip_ranges_to_nat = var.source_subnetwork_ip_ranges_to_nat
}
