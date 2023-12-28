# Read down an existing Account Member by email
data "prefect_account_member" "paul" {
  email = "paul@dataroots.io"
}

# Read down the default Owner Account Role
data "prefect_account_role" "owner" {
  name = "Member"
}

data "prefect_work_pool" "my_pool" {
  name = "my-work-pool"
}