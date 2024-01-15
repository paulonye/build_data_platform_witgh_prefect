output "aws_vpc_id" {
  value = aws_vpc.aws-vpc.id
}

output "aws_ecs_cluster_arn" {
  value = aws_ecs_cluster.aws-ecs-cluster.arn
}

output "aws_iam_taskexecution_role_arn" {
  value = aws_iam_role.ecsTaskExecutionRole.arn
}

output "aws_ecr_repo_url" {
  value = aws_ecr_repository.aws-ecr.repository_url
}

output "aws_ecr_repo_name" {
  value = aws_ecr_repository.aws-ecr.name
}

output "aws_task_definition_arn" {
  value = aws_ecs_task_definition.task.arn
}