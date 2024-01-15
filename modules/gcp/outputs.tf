output "gcp_repo_id" {
  value = google_artifact_registry_repository.my-repo.id
}

output "gcp_repo_name" {
  value = google_artifact_registry_repository.my-repo.name
}
