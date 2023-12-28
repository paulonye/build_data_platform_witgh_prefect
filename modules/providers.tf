terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.10.0"
    }
  }
  backend "gcs" { 
      bucket  = "terraform-state-pb"
    }
}

provider "google" {
  project = var.project
  region = var.region
}