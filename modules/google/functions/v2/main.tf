
resource "google_cloudfunctions2_function" "this" {
  name     = var.function_name
  location = var.location

}
