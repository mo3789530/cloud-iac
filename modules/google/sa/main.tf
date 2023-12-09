module "service_accounts" {
  source             = "terraform-google-modules/service-accounts/google"
  version            = "~> 3.0"
  project_id         = var.project_id
  prefix             = var.prefix
  names              = var.names
  grant_billing_role = var.grant_billing_role
  description        = var.description
  project_roles      = try(var.project_roles, [])
}
