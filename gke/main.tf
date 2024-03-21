provider "google" {
  project = "massive-clone-417822"
  region  = "us-central1"
}

terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
            version = "4.47.0"
        }
    }
}
resource "google_service_account" "default" {
  account_id   = "gke-cluster-1"
  display_name = "service account for cluster Ademi"
}

resource "google_container_cluster" "primary" {
  name     = "cluster-1"
  location = "us-central1-c"
  initial_node_count  = 3
  node_config {
    disk_size_gb = 50
  }
}

