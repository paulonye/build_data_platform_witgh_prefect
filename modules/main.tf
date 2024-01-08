module "gcp" {
  source  = "./gcp"
  project = var.project
  region  = var.region
  repo_id = var.repo_id
}

module "prefect_ecs_work_pool" {
  source               = "./prefect"
  workpool_name        = var.workpool_name
  workpool_type        = var.workpool_type
  workpool_status      = var.workpool_status
  prefect_workspace_id = var.prefect_workspace_id
  base_job_template    = file(var.base_job_template)
  prefect_api_key      = var.prefect_api_key
  prefect_account_id   = var.prefect_account_id
}

module "aws" {
  source             = "./aws"
  app_name           = var.app_name
  app_environment    = var.app_environment
  public_subnet     = var.public_subnet
  availability_zones = var.availability_zones
  aws_region         = var.aws_region
  aws_access_key     = var.aws_access_key
  aws_secret_key     = var.aws_secret_key
}

output "vpc_id" {
  value = module.aws.vpc_id
}

output "ecs_cluster_arn" {
  value = module.aws.ecs_cluster_arn
}

output "iam_taskexecution_role_arn" {
  value = module.aws.iam_taskexecution_role_arn
}

output "ecr_repo_url" {
  value = module.aws.ecr_repo_url
}

output "ecr_repo_name" {
  value = module.aws.ecr_repo_name
}