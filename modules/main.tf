module "gcp" {
  source  = "./gcp"
  project = var.project
  region  = var.region
  repo_id = var.repo_id
}

module "prefect_work_pool" {
  source               = "./prefect"
  workpool_name        = var.workpool_name
  workpool_type        = var.workpool_type
  workpool_status      = var.workpool_status
  prefect_workspace_id = var.prefect_workspace_id
  base_job_template    = file(var.base_job_template)
  prefect_api_key      = var.prefect_api_key
  prefect_account_id   = var.prefect_account_id
}
