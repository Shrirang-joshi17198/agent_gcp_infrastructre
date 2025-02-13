output "deny_firewall_rule_name" {
  description = "The name of the firewall rule blocking specific IPs"
  value       = google_compute_firewall.deny_specific_ips.name
}

output "allow_firewall_rule_name" {
  description = "The name of the firewall rule allowing all traffic"
  value       = google_compute_firewall.allow_all.name
}
