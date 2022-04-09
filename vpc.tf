module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 4.0"

  project_id   = var.project_id
  network_name = "${var.project_id}-vpc"
  routing_mode = "GLOBAL"

  subnets = [
    {
      subnet_name   = "${var.project_id}-subnet"
      subnet_ip     = "10.0.0.0/20"
      subnet_region = var.region
    }
  ]

  secondary_ranges = {
    "${var.project_id}-subnet" = [
      {
        range_name    = "pods"
        ip_cidr_range = "172.16.0.0/15"
      },
      {
        range_name    = "services"
        ip_cidr_range = "192.168.0.0/19"
      }
    ]
  }

  routes = [
    {
      name              = "egress-internet"
      description       = "route through IGW to access internet"
      destination_range = "0.0.0.0/0"
      tags              = "egress-inet"
      next_hop_internet = "true"
    }
  ]
}
