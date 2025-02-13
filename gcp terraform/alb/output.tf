output "lb_ip_address" {
  description = "The external IP address of the Load Balancer"
  value       = google_compute_global_address.lb_ip.address
}

output "lb_forwarding_rule" {
  description = "The URL of the Load Balancer forwarding rule"
  value       = google_compute_global_forwarding_rule.default.self_link
}
