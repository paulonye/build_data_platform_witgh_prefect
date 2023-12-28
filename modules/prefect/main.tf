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
  name         = "cloud-run-job-infra"
  type         = "cloud-run:push"
  paused       = false
  workspace_id = var.workspace_id
}
