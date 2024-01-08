resource "google_cloud_run_v2_service" "this" {
  name     = var.name
  location = var.location
  ingress  = "INGRESS_TRAFFIC_ALL"

  template {
    revision = var.template.revision
    containers {
      image = var.template.containers.image
    }
    vpc_access {
      connector = 
      egress = 
      network_interfaces {
        network = module.vpc.network_name
        subnetwork = 
        tags = 
      }
    }
  }
}


variable "template" {
  type = object({
    revision = string
    containers = object({
      image = string
    })
  })
  default = {
    revision = "1"
    containers = {
      image = "us-docker.pkg.dev/cloudrun/container/hello"
    }
  }

}
