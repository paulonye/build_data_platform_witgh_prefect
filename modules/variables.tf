variable "project" {
  type        = string
  default     = "chrome-epigram-386922"
  description = "The Gcp Project Id"
}

variable "region" {
  type    = string
  default = "us-east1"
}

variable "repo_id" {
  type    = string
  default = "prefect-repository"
}

variable "prefect_workspace_id" {
  description = "Workspace id of the Prefect Account"
  default     = "853697d1-0a7b-4531-bb9e-099475f0dd3f"
}

variable "prefect_api_key" {
  description = "Api key that gives access to Prefect Account"
  default     = "pnu_0bWwwVKkReDIY6b2LdX4PUKWUbSVKW4bOKGq"
}

variable "prefect_account_id" {
  description = "Account id of your Prefect Account"
  default     = "1e75118d-08d5-4d97-9250-670641adb003"
}

variable "base_job_template" {
  description = "Json configuration file for workpool"
  default     = "./base-job-template.json"
  type        = string
}

variable "workpool_name" {
  description = "Name given to the workpool"
  default     = "cloud-run-job-infra"
  type        = string
}

variable "workpool_type" {
  description = "The Workpool type"
  default     = "cloud-run:push"
  type        = string
}

variable "workpool_status" {
  description = "Whether the workpool is paused or not"
  type        = bool
  default     = false
}