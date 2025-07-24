terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = "us-central1"  # Fixed region for Pub/Sub
}

# Create Pub/Sub topic
resource "google_pubsub_topic" "main_topic" {
  name = "${var.topic_name}-topic"  # Add -topic suffix
}

# Create Pub/Sub subscription
resource "google_pubsub_subscription" "main_subscription" {
  name  = "${var.subscription_name}-sub"  # Add -sub suffix
  topic = google_pubsub_topic.main_topic.name
  ack_deadline_seconds = 10
}

# Create Cloud Storage bucket
resource "google_storage_bucket" "main_bucket" {
  name          = var.bucket_name
  location      = "US"        # Fixed US multi-region to stay in free tier
  force_destroy = true
  storage_class = "STANDARD"

  versioning {
    enabled = false
  }
}
