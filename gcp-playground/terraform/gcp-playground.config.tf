provider "google" {
  project = "${var.project}"
  region  = "${var.region}"
  zone    = "${var.zone}"
}

terraform {
  backend "gcs" {
    bucket = "i-wonder-whether-buckets-can-have-longer-names"
    prefix = "gcp-playground"
  }
}