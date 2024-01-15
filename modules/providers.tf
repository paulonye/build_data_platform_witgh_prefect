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
    aws = {
      source  = "hashicorp/aws"
      version = "5.31.0"
    }
  }
  backend "gcs" {
    bucket = "terraform-state-pb"
  }
}

provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
}

provider "prefect" {
  api_key    = var.prefect_api_key
  account_id = var.prefect_account_id
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}