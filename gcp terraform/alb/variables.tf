variable "network" {
  description = "VPC network name"
  type        = string
}

variable "subnetwork" {
  description = "Subnetwork name"
  type        = string
}

variable "region" {
  description = "Region where resources will be created"
  type        = string
}
variable "zone" {
  description = "The zone where the Network Endpoint Group (NEG) will be created"
  type        = string
}
