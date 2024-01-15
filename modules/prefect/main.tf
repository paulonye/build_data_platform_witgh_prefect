resource "prefect_work_pool" "workpool" {
  name              = var.workpool_name
  type              = var.workpool_type
  paused            = var.workpool_status
  workspace_id      = var.prefect_workspace_id
  base_job_template = var.base_job_template
}
