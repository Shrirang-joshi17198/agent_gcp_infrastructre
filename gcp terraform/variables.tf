variable "region" {
  description = "The GCP region to deploy resources"
  type        = string
  default     = "us-central1"
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "my-vpc"
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "my-subnet"
}

variable "subnet_cidr" {
  description = "The CIDR block for the subnet"
  type        = string
  default     = "10.0.0.0/24"
}

variable "db_instance_name" {
  description = "Cloud SQL instance name"
  type        = string
  default     = "my-cloudsql-instance"
}

variable "db_version" {
  description = "Database version for Cloud SQL"
  type        = string
  default     = "MYSQL_8_0"
}

variable "db_user" {
  description = "Database user"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
  default = "admin"
}

variable "instance_name" {
  description = "Name of the compute instance"
  type        = string
  default     = "my-instance"
}

variable "enable_waf" {
  description = "Enable WAF security"
  type        = bool
  default     = true
}

variable "enable_iam" {
  description = "Enable IAM security policies"
  type        = bool
  default     = true
}
variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default = "terraform-project-shrirang"
}
variable "network_name" {
  description = "The name of the network"
  type        = string
  default = "my-vpc"
}

variable "deny_ip_ranges" {
  description = "List of IP ranges to deny access"
  type        = list(string)
  default     = ["203.0.113.0/24"]  # Update as needed
}

variable "allow_all" {
  description = "Allow all incoming traffic"
  type        = bool
  default     = true
}
variable "backend_instance_group" {
  description = "The backend instance group for the load balancer"
  type        = string
}