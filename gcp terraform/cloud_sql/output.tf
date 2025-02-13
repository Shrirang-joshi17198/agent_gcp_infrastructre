output "db_instance_name" {
  description = "The name of the Cloud SQL instance"
  value       = google_sql_database_instance.db_instance.name
}

output "db_instance_self_link" {
  description = "The self-link of the Cloud SQL instance"
  value       = google_sql_database_instance.db_instance.self_link
}

output "db_user" {
  description = "The username created for the database"
  value       = google_sql_user.db_user.name
}
