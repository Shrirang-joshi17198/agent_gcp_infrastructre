variable "db_instance_name" {
  description = "The name of the Cloud SQL instance"
  type        = string
}

variable "db_version" {
  description = "The database version (e.g., MYSQL_8_0, POSTGRES_13)"
  type        = string
}

variable "region" {
  description = "The GCP region where the Cloud SQL instance will be deployed"
  type        = string
}

variable "db_tier" {
  description = "The tier (machine type) of the database instance (e.g., db-f1-micro for cost efficiency)"
  type        = string
}

variable "db_user" {
  description = "The username for the database"
  type        = string
}

variable "db_password" {
  description = "The password for the database user"
  type        = string
  sensitive   = true
}
