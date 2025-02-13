resource "google_compute_firewall" "deny_specific_ips" {
  name    = "deny-specific-ips"
  network = "my-vpc"  
  project = var.project_id

  direction = "INGRESS"
  priority  = 1000

  source_ranges = ["203.0.113.0/24"] # Block these IPs
  deny {
    protocol = "all"
  }
}

resource "google_compute_firewall" "allow_all" {
  name    = "allow-all"
  network = "default"  # Replace with your network name
  project = var.project_id

  direction = "INGRESS"
  priority  = 65535

  source_ranges = ["0.0.0.0/0"] # Allow all traffic
  allow {
    protocol = "all"
  }
}
