# GKE cluster
resource "google_container_cluster" "gke_cluster" {
  name     = "${var.project_id}-gke"
  location = var.region
  project = var.project_id

  remove_default_node_pool = true
  initial_node_count       = 1

  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name

  release_channel {
    channel = "STABLE"
  }

  vertical_pod_autoscaling {
    enabled = false
  }

  addons_config {
    horizontal_pod_autoscaling {
      disabled = false
    }
  }

}

#GKE node pool
resource "google_container_node_pool" "primary_node_pool" {
  name       = "${google_container_cluster.gke_cluster.name}-node-pool"
  location   = var.region
  cluster    = google_container_cluster.gke_cluster.name
  node_count = var.gke_num_nodes

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      env = var.project_id
    }

    machine_type = "n1-standard-1"
    tags         = ["gke-node", "${var.project_id}-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}