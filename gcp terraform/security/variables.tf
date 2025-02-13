variable "project_id" {
  description = "The ID of the project where resources will be created"
  type        = string
}

variable "network_name" {
  description = "The name of the VPC network"
  type        = string
  default     = "my-vpc"
}

variable "deny_ip_ranges" {
  description = "List of IP ranges to block"
  type        = list(string)
  default     = ["203.0.113.0/24"]
}

variable "allow_all" {
  description = "Allow all incoming traffic"
  type        = bool
  default     = true
}
