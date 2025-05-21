output "website_url" {
  description = "Your static website URL"
  value       = "http://${google_storage_bucket.website_bucket.name}.storage.googleapis.com"
}
