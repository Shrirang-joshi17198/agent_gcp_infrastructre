variable "node_count" {
  description = "Number of nodes in the GKE cluster"
  type        = number
}

variable "machine_type" {
  description = "Machine type of the GKE nodes"
  type        = string
}

variable "network" {
  description = "VPC network name"
  type        = string
}

variable "subnetwork" {
  description = "Subnetwork name"
  type        = string
}

variable "cluster_name" {
    description = "cluster name"
    type = string
  
}
variable "region" {
  description = "The region where the GKE cluster will be deployed"
  type        = string
}