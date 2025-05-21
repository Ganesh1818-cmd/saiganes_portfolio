variable "project_id" {
  description = "Your Google Cloud Project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "bucket_name" {
  description = "Globally unique GCS bucket name"
  type        = string
}

variable "credentials_file" {
  description = "Path to the GCP service account JSON file"
  type        = string
}
