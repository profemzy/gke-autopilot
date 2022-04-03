# google_client_config and kubernetes provider must be explicitly specified like the following.
data "google_client_config" "default" {}

module "gke" {
  source                          = "terraform-google-modules/kubernetes-engine/google//modules/beta-autopilot-public-cluster"
  project_id                      = var.project_id
  name                            = "${var.project_id}-gke"
  region                          = var.region
  zones                           = [var.zone]
  network                         = module.vpc.network_name
  subnetwork                      = module.vpc.subnets_names[0]
  ip_range_pods                   = "pods"
  ip_range_services               = "services"
  horizontal_pod_autoscaling      = true
  enable_vertical_pod_autoscaling = true
  master_authorized_networks      = var.allowed-ips
}
