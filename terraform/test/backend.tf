terraform {
  backend "gcs" {
    bucket  = "reddit-storage-bucket-test"
    prefix  = "terraform/state/stage"
  }
}
