terraform {
  required_providers {
    prefect = {
      source  = "PrefectHQ/prefect"
      version = "0.1.1"
    }
  }
}

provider "prefect" {
  api_key    = var.prefect_api_key
  account_id = var.prefect_account_id
}
