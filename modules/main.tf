module "gcp" {
  source  = "./gcp"
  project = var.gcp_project
  region  = var.gcp_region
  repo_id = var.gcp_repo_id
}

module "prefect_ecs_work_pool" {
  source               = "./prefect"
  workpool_name        = "aws-ecs-infra"
  workpool_type        = "ecs:push"
  workpool_status      = var.workpool_status
  prefect_workspace_id = var.prefect_workspace_id
  base_job_template = templatefile("ecs-base-job-template-2.json", { TASK_DEFNITION_ARN = module.aws.aws_task_definition_arn,
    CLUSTER_ARN = module.aws.aws_ecs_cluster_arn,
    REPO_URL    = module.aws.aws_ecr_repo_url,
    TAG         = "latest",
    REPO_NAME   = module.aws.aws_ecr_repo_name,
  VPC_ID = module.aws.aws_vpc_id })
  prefect_api_key    = var.prefect_api_key
  prefect_account_id = var.prefect_account_id
}

module "prefect_cloud_run_work_pool" {
  source               = "./prefect"
  workpool_name        = "cloud-run-job-infra"
  workpool_type        = "cloud-run:push"
  workpool_status      = var.workpool_status
  prefect_workspace_id = var.prefect_workspace_id
  base_job_template = templatefile("base-job-template.json", { REGION = var.gcp_region,
    PROJECT_ID = var.gcp_project,
    REPO_ID    = var.gcp_repo_id,
    IMAGE_NAME = "run-prefect-job",
  TAG = "latest" })
  prefect_api_key    = var.prefect_api_key
  prefect_account_id = var.prefect_account_id
}

module "aws" {
  source             = "./aws"
  app_name           = var.app_name
  app_environment    = var.app_environment
  public_subnet      = var.public_subnet
  availability_zones = var.availability_zones
  aws_region         = var.aws_region
  aws_access_key     = var.aws_access_key
  aws_secret_key     = var.aws_secret_key
}