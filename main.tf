provider "google" {
  project = "sre-scratchpad"
  region  = "europe-west1"
}

provider "google-beta" {
  project = "sre-scratchpad"
  region  = "europe-west1"
}

#provider "kubernetes" {
#  host                   = "https://${module.gke.endpoint}"
#  token                  = data.google_client_config.default.access_token
#  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
#}

provider "kubernetes" {
  config_path = "~/.kube/config"
}
