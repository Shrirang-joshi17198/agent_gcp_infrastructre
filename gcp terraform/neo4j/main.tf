resource "google_compute_instance" "neo4j" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "neo4j-cloud/neo4j-enterprise" 
    }
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork

    access_config {
      // Assigns an external IP
    }
  }

  metadata = {
    startup-script = <<EOT
      #!/bin/bash
      sudo apt update -y
      sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
      
      # Install Neo4j
      wget -O - https://debian.neo4j.com/neotechnology.gpg.key | sudo apt-key add -
      echo 'deb https://debian.neo4j.com stable 5' | sudo tee /etc/apt/sources.list.d/neo4j.list
      sudo apt update -y
      sudo apt install -y neo4j

      # Enable and start Neo4j service
      sudo systemctl enable neo4j
      sudo systemctl start neo4j

      # Configure Neo4j default password
      echo "Setting up Neo4j password"
      neo4j-admin set-initial-password ${var.neo4j_password}
    EOT
  }

  service_account {
    email  = var.service_account_email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  tags = ["neo4j"]
}
