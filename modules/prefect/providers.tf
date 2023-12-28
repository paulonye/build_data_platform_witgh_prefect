terraform {
  required_providers {
    prefect = {
      source = "prefecthq/prefect"
    }
  }
}

# By default, the provider points to Prefect Cloud
# and you can pass in your API key and account ID
# via variables or static inputs.
provider "prefect" {
  api_key    = var.prefect_api_key
  account_id = var.prefect_account_id
}
