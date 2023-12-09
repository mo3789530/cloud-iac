module "gcs_buckets" {
  source                 = "terraform-google-modules/cloud-storage/google"
  version                = "~> 5.0"
  project_id             = var.project_id
  location               = var.location
  storage_class          = var.storage_class
  names                  = var.names
  prefix                 = var.prefix
  randomize_suffix       = var.randomize_suffix
  set_admin_roles        = var.set_admin_roles
  admins                 = var.storage_admins
  bucket_lifecycle_rules = var.bucket_lifecycle_rules
  force_destroy          = var.force_destroy
  versioning             = var.versioning
  bucket_admins          = var.bucket_admins
  cors                   = var.cors
  encryption_key_names = var.encryption_key_names
}
