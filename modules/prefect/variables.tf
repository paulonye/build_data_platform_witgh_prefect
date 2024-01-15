variable "prefect_api_key" {
  description = "Api key that gives access to Prefect Account"
  type        = string
}

variable "prefect_account_id" {
  description = "Account id of your Prefect Account"
  type        = string
}

variable "prefect_workspace_id" {
  description = "Workspace id of the Prefect Account"
  type        = string
}

variable "base_job_template" {
  description = "Json configuration file for workpool"
  type        = string
}

variable "workpool_name" {
  description = "Name given to the workpool"
  type        = string
}

variable "workpool_type" {
  description = "The Workpool type"
  type        = string
}

variable "workpool_status" {
  description = "Whether the workpool is paused or not"
  type        = bool
}