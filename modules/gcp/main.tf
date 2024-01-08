# resource "google_cloud_run_v2_job" "default" {
#   name     = "cloudrun-job"
#   location = "us-central1"

#   template {
#     template {
#       containers {
#         image = "us-docker.pkg.dev/cloudrun/container/hello"
#       }
#     }
#   }

#   lifecycle {
#     ignore_changes = [
#       launch_stage,
#     ]
#   }
# }


resource "google_artifact_registry_repository" "my-repo" {
  location      = var.region
  repository_id = var.repo_id
  description   = "Repository for hosting prefect jobs docker images"
  format        = "DOCKER"

  docker_config {
    immutable_tags = true
  }
}