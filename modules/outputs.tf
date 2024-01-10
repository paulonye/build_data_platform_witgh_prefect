output "vpc_id" {
  value = module.aws.vpc_id
}

output "ecs_cluster_arn" {
  value = module.aws.ecs_cluster_arn
}

output "task_definition_arn" {
  value = module.aws.task_definition_arn
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