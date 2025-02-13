output "instance_name" {
  description = "The name of the Neo4j instance"
  value       = google_compute_instance.neo4j.name
}

output "public_ip" {
  description = "The public IP of the Neo4j instance"
  value       = google_compute_instance.neo4j.network_interface.0.access_config.0.nat_ip
}

output "internal_ip" {
  description = "The internal IP of the Neo4j instance"
  value       = google_compute_instance.neo4j.network_interface.0.network_ip
}
