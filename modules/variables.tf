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
}

variable "prefect_api_key" {
  description = "Api key that gives access to Prefect Account"
}

variable "prefect_account_id" {
  description = "Account id of your Prefect Account"
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