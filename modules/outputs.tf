output "aws_vpc_id" {
  value = module.aws.aws_vpc_id
}

output "aws_ecs_cluster_arn" {
  value = module.aws.aws_ecs_cluster_arn
}

output "aws_task_definition_arn" {
  value = module.aws.aws_task_definition_arn
}


output "aws_iam_taskexecution_role_arn" {
  value = module.aws.aws_iam_taskexecution_role_arn
}

output "aws_ecr_repo_url" {
  value = module.aws.aws_ecr_repo_url
}

output "aws_ecr_repo_name" {
  value = module.aws.aws_ecr_repo_name
}

output "gcp_repo_id" {
  value = module.gcp.gcp_repo_id
}

output "gcp_repo_name" {
  value = module.gcp.gcp_repo_name
}