module "gcp" {
  source  = "./gcp"
  project = var.project
  region  = var.region
  repo_id = var.repo_id
}