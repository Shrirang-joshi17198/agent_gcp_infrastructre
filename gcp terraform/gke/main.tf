resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region
  deletion_protection = false

  node_pool {
    name       = "default-pool"
    node_count = var.node_count

    node_config {
      machine_type = var.machine_type
      disk_size_gb = 30
      oauth_scopes = [
        "https://www.googleapis.com/auth/cloud-platform"
      ]
    }
  }

  network = var.network
  subnetwork = var.subnetwork
}
