variable "project" {
  type = string
  default = "chrome-epigram-386922"
  description = "The Gcp Project Id"
}

variable "region" {
    type = string
    default = "us-east1"  
}

variable "repo_id" {
    type = string
    default = "prefect-repository"
}