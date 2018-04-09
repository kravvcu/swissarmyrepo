terraform {
  backend "gcs" {
    bucket = "i-wonder-whether-buckets-can-have-longer-names"
    path   = "gcp-playground/stage/networks.tfstate"
  }
}
