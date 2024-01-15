resource "google_artifact_registry_repository" "my-repo" {
  location      = var.region
  repository_id = var.repo_id
  description   = "Repository for hosting prefect jobs docker images"
  format        = "DOCKER"

  docker_config {
    immutable_tags = false
  }
}