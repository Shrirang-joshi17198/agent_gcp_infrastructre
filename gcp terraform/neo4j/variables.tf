variable "instance_name" {
  description = "The name of the Neo4j instance"
  type        = string
}

variable "machine_type" {
  description = "The machine type for the Neo4j VM (e.g., e2-medium for cost efficiency)"
  type        = string
}

variable "zone" {
  description = "The zone in which the Neo4j VM will be deployed"
  type        = string
}

variable "network" {
  description = "The network in which the instance will be created"
  type        = string
}

variable "subnetwork" {
  description = "The subnetwork for the instance"
  type        = string
}

variable "neo4j_password" {
  description = "Initial password for Neo4j"
  type        = string
  sensitive   = true
}

variable "service_account_email" {
  description = "The service account email to associate with the VM"
  type        = string
}
