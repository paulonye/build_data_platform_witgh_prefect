# resource "prefect_workspace_role" "custom_role" {
#   name = "Custom Workspace Role"
#   scopes = [
#     "manage_blocks",
#     "see_flows"
#   ]
# }

# # Assign the Workspace Role to the Account Member
# resource "prefect_workspace_access" "developer" {
#   accessor_type     = "USER"
#   accessor_id       = data.prefect_account_member.paul.user_id
#   workspace_id      = var.workspace_id
#   workspace_role_id = prefect_workspace_role.custom_role.id
# }

resource "prefect_work_pool" "example" {
  name         = var.workpool_name
  type         = var.workpool_type
  paused       = var.workpool_status
  workspace_id = var.prefect_workspace_id
  base_job_template = var.base_job_template
}
