resource "google_compute_global_address" "lb_ip" {
  name = "lb-static-ip"
}

resource "google_compute_backend_service" "default" {
  name                  = "my-backend-service"
  load_balancing_scheme = "EXTERNAL"

  backend {
    group          = google_compute_network_endpoint_group.gke_neg.self_link 
    balancing_mode = "RATE"
    max_rate_per_endpoint = 50 
  }
  health_checks = [google_compute_health_check.default.self_link]
  protocol = "HTTPS"
}

resource "google_compute_network_endpoint_group" "gke_neg" {
  name                  = "gke-neg"
  network               = var.network
  subnetwork            = var.subnetwork
  zone                  = var.zone
  default_port          = 80
  network_endpoint_type = "GCE_VM_IP_PORT"
}

resource "google_compute_health_check" "default" {
  name = "gke-health-check"

  http_health_check {
    request_path = "/"
    port         = 80
  }
}

resource "google_compute_url_map" "default" {
  name = "lb-url-map"

  default_service = google_compute_backend_service.default.id
}

resource "google_compute_target_http_proxy" "default" {
  name    = "lb-target-http-proxy"
  url_map = google_compute_url_map.default.id
}

resource "google_compute_global_forwarding_rule" "default" {
  name                  = "lb-forwarding-rule"
  target                = google_compute_target_http_proxy.default.id
  load_balancing_scheme = "EXTERNAL"
  port_range            = "80"
  ip_address            = google_compute_global_address.lb_ip.address
}
