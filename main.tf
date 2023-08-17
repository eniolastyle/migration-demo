terraform {
  required_providers {
    spacelift = {
      source  = "spacelift-io/spacelift"
      version = "~> 1.0"
    }
  }
}

resource "spacelift_stack" "getting_started" {
  autodeploy        = false
  branch            = "main"
  name              = "getting-started"
  project_root      = ""
  repository        = "tfc-getting-started"
  terraform_version = "1.5.0"

  # 8< --------------------------------------------------------------
  # Delete the following line after the stack has been created
  import_state_file = "/mnt/workspace/state-import/getting-started.tfstate"
  # -------------------------------------------------------------- 8<
}

resource "spacelift_environment_variable" "getting_started_tf_var_provider_token" {
  stack_id   = spacelift_stack.getting_started.id
  name       = "TF_VAR_provider_token"
  value      = ""
  write_only = true
}
