# Creates SRE Namespace
resource "kubernetes_namespace" "sre" {
  metadata {
    annotations = {
      name = "sre"
    }

    labels = {
      app = "sre-apps"
    }

    name = "sre"
  }
}
