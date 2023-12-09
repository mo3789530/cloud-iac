module "firewall_rules" {
  source       = "terraform-google-modules/network/google//modules/firewall-rules"
  project_id   = var.project_id
  network_name = var.network_name

  egress_rules = var.egress_rules
  ingress_rule = var.ingress_rules
}
