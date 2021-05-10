output "gke_cluster_name" {
  value = google_container_cluster.gke_cluster.name
}

output "region" {
  value = google_container_cluster.gke_cluster.location
}

output "project_id" {
  value = google_container_cluster.gke_cluster.project
}