module "safer_mysql" {
  source                                   = "terraform-google-modules/sql-db/google//modules/safer_mysql"
  version                                  = "~> 18.0.0"
  project_id                               = var.project_id
  name                                     = var.name
  region                                   = var.region
  secondary_zone                           = var.secondary_zone
  vpc_network                              = var.vpc_network
  read_replicas                            = var.read_replicas
  random_instance_name                     = var.random_instance_name
  read_replica_deletion_protection         = var.read_replica_deletion_protection
  read_replica_deletion_protection_enabled = var.read_replica_deletion_protection_enabled
  read_replica_name_suffix                 = var.read_replica_name_suffix
  insights_config                          = var.insights_config
  edition                                  = var.edition
  disk_type                                = var.disk_type
  disk_size                                = var.disk_size
  disk_autoresize                          = var.disk_autoresize
  database_version                         = var.database_version
  deletion_protection                      = var.deletion_protection
  deletion_protection_enabled              = var.deletion_protection_enabled
  backup_configuration                     = var.backup_configuration
  availability_type                        = var.availability_type
  activation_policy                        = var.activation_policy
}

