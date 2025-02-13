module "networking" {
  source       = "./networking"
  vpc_name     = var.vpc_name
  subnet_name  = var.subnet_name
  region       = var.region
}

module "gke" {
  source         = "./gke"
  cluster_name   = "my-gke-cluster"
  region         = "us-central1"
  node_count     = 1
  machine_type   = "e2-medium"  
  network        = module.networking.network_name
  subnetwork     = module.networking.subnet_name
}

module "cloud_sql" {
  source          = "./cloud_sql"
  db_instance_name = "my-cloud-sql-instance"
  region          = "us-central1"
  db_version      = "MYSQL_8_0"
  db_tier         = "db-f1-micro"
  db_user         = "admin"
  db_password     = "securepassword"
}

# module "neo4j" {
#   source                = "./neo4j"
#   instance_name         = "neo4j-instance"
#   machine_type          = "e2-medium"
#   zone                  = "us-central1-a"
#   network               = module.networking.network_name
#   subnetwork            = module.networking.subnet_name
#   neo4j_password        = "securepassword"
#   service_account_email = "service-account-for-terraform@terraform-project-shrirang.iam.gserviceaccount.com"
# }



# module "compute" {
#   source       = "./modules/compute"
#   instance_name = var.instance_name
#   machine_type  = "e2-micro"  # Cost-efficient compute instance
#   region        = var.region
#   network       = module.network.network_name
# }

module "security" {
  source       = "./security"
  project_id   = var.project_id
  network_name = var.network_name
  deny_ip_ranges = var.deny_ip_ranges
  allow_all    = var.allow_all
}

module "alb" {
  source     = "./alb"
  network    = module.networking.network_name
  subnetwork = module.networking.subnet_name
  region     = var.region
  zone       = "us-central1-a"
}





# module "monitoring" {
#   source       = "./modules/monitoring"
#   enable_logging = var.enable_logging
# }

# module "automation" {
#   source       = "./modules/automation"
#   enable_terraform = var.enable_terraform
# }