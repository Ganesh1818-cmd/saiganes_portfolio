terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  credentials = file(var.credentials_file)
  project     = var.project_id
  region      = var.region
}

resource "google_storage_bucket" "website_bucket" {
  name     = var.bucket_name
  location = var.region
  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_object" "index" {
  name         = "index.html"
  bucket       = google_storage_bucket.website_bucket.name
  source       = "website/index.html"
  content_type = "text/html"
}

resource "google_storage_bucket_object" "style" {
  name         = "style.css"
  bucket       = google_storage_bucket.website_bucket.name
  source       = "website/style.css"
  content_type = "text/css"
}

resource "google_storage_bucket_object" "script" {
  name         = "script.js"
  bucket       = google_storage_bucket.website_bucket.name
  source       = "website/script.js"
  content_type = "application/javascript"
}

resource "google_storage_bucket_iam_member" "public_access" {
  bucket = google_storage_bucket.website_bucket.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}
