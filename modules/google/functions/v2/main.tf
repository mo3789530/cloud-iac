
resource "google_cloudfunctions2_function" "this" {
  name        = var.function_name
  location    = var.location
  description = var.description


  dynamic "build_config" {
    for_each = try(var.build_config, {})
    content {
      runtime     = var.build_config.runtime
      entry_point = var.build_config.entry_point
      source {
        storage_source {
          bucket = var.build_config.source_bucket
          object = var.build_config.source_object
        }
      }
    }
  }

  service_config {
    available_cpu                 = var.service_config.available_cpu
    available_memory              = var.service_config.available_memory_mb
    timeout_seconds               = var.service_config.timeout
    max_instance_count            = var.service_config.max_instance_count
    min_instance_count            = var.service_config.min_instance_count
    vpc_connector                 = var.service_config.vpc_connector
    vpc_connector_egress_settings = var.service_config.vpc_connector_egress_settings
    ingress_settings              = var.service_config.ingress_settings
    service_account_email         = var.service_config.service_account
  }


  lifecycle {
    ignore_changes = [service_config, source, build_config]
  }

}
