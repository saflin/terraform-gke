variable "project_id" {
  type = string
  description = "GCP project id"
}

variable "region" {
  type = string
  description = "GCP Region"
  default = "europe-west2"
}

variable "subnet_ip_cidr_range" {
  type = string
  description = "Subnet IP cidr range"
  default = "10.10.0.0/24"
}

variable "gke_num_nodes" {
  type = number
  description = "Number of nodes in node pool"
  default = 1
}
