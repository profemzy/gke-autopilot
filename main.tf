provider "google" {
  project = var.project_id
  region  = var.region
}

provider "google-beta" {
  project = "sre-scratchpad"
  region  = "europe-west1"
}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}
