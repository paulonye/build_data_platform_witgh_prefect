output "vpc_id" {
  value = aws_vpc.aws-vpc.id
}

output "ecs_cluster_arn" {
  value = aws_ecr_repository.aws-ecr.arn
}

output "iam_taskexecution_role_arn" {
  value = aws_iam_role.ecsTaskExecutionRole.arn
}

output "ecr_repo_url" {
  value = aws_ecr_repository.aws-ecr.repository_url
}

output "ecr_repo_name" {
  value = aws_ecr_repository.aws-ecr.name
}

output "task_definition_arn" {
  value = aws_ecs_task_definition.task.arn
}