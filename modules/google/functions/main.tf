
resource "google_cloudfunctions_function" "this" {
  name                          = var.name
  description                   = var.description
  available_memory_mb           = var.available_memory_mb
  max_instances                 = var.max_instances
  timeout                       = var.timeout_s
  entry_point                   = var.entry_point
  ingress_settings              = var.ingress_settings
  trigger_http                  = var.trigger_http
  vpc_connector_egress_settings = var.vpc_connector_egress_settings
  vpc_connector                 = var.vpc_connector

  dynamic "event_trigger" {
    for_each = var.trigger_http != null ? [] : [1]

    content {
      event_type = var.event_trigger["event_type"]
      resource   = var.event_trigger["resource"]

      failure_policy {
        retry = var.event_trigger_failure_policy_retry
      }
    }
  }

  dynamic "secret_environment_variables" {
    for_each = { for item in var.secret_environment_variables : item.key => item }

    content {
      key        = secret_environment_variables.value["key"]
      project_id = try(data.google_project.nums[secret_environment_variables.value["project_id"]].number, data.google_project.default[0].number)
      secret     = secret_environment_variables.value["secret_name"]
      version    = lookup(secret_environment_variables.value, "version", "latest")
    }
  }

  labels                      = var.labels
  runtime                     = var.runtime
  environment_variables       = var.environment_variables
  source_archive_bucket       = var.bucket_name
  source_archive_object       = var.storage_bucket_object_name
  project                     = var.project_id
  region                      = var.region
  service_account_email       = var.service_account_email
  build_environment_variables = var.build_environment_variables
  docker_registry             = var.docker_registry
  docker_repository           = var.docker_repository
  kms_key_name                = var.kms_key_name
}
