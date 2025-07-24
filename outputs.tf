output "pubsub_topic" {
  value = google_pubsub_topic.main_topic.name
}

output "pubsub_subscription" {
  value = google_pubsub_subscription.main_subscription.name
}

output "bucket_name" {
  value = google_storage_bucket.main_bucket.name
}
