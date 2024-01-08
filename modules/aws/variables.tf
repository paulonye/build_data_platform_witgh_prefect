variable "public_subnet" {
  description = "Subnets for ECS"
}

variable "app_name" {
  description = "Name of application"
}

variable "app_environment" {
  description = "Deployment environment"
}

variable "availability_zones" {
  description = "Availability zone of ECS"
}

variable "aws_region" {
  description = "Region of AWS resource"
}

variable "aws_access_key" {
  description = "Access key for IAM user"
}

variable "aws_secret_key" {
  description = "Secret key for IAM user"
}