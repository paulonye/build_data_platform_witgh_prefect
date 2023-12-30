terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.10.0"
    }
    prefect = {
      source  = "PrefectHQ/prefect"
      version = "0.1.1"
    }
  }
  backend "gcs" {
    bucket = "terraform-state-pb"
  }
}

provider "google" {
  project = var.project
  region  = var.region
}

provider "prefect" {
  api_key    = var.prefect_api_key
  account_id = var.prefect_account_id
}
