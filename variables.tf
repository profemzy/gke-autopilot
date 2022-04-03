variable "project_id" {
  type        = string
  description = "GCP Project ID"
}

variable "region" {
  description = "GCP Project Region"
}

variable "zone" {
  description = "GCP Zone"
}

variable "allowed-ips" {
  type = list(object({
    cidr_block   = string,
    display_name = string
  }))
}
