variable "project_id" {
  type        = string
  description = "GCP Project ID"
}

variable "bucket_name" {
  type        = string
  description = "Cloud Storage bucket name"
}

variable "topic_name" {
  type        = string
  description = "Base name for Pub/Sub topic (will add -topic)"
}

variable "subscription_name" {
  type        = string
  description = "Base name for Pub/Sub subscription (will add -sub)"
}
