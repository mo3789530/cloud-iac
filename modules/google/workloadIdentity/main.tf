resource "google_iam_workload_identity_pool" "this" {
  workload_identity_pool_id = var.workload_identity_pool_id
  display_name              = var.display_name
  description               = "Identity pool for automated"
  disabled                  = false
}


resource "google_iam_workload_identity_pool_provider" "this" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.this.workload_identity_pool_id
  workload_identity_pool_provider_id = var.workload_identity_pool_provider_id
  display_name                       = var.display_name
  description                        = var.description
  disabled                           = var.disabled
  attribute_condition                = var.attribute_condition
  attribute_mapping = {
    "google.subject"        = var.attribute_mapping.google.subject
    "attribute.aws_account" = var.attribute_mapping.attribute.aws_account
    "attribute.environment" = var.attribute_mapping.attribute.environment
  }
  aws {
    account_id = var.external_account_id
  }
}