data "terraform_remote_state" "addresses" {
  backend = "gcs"
  config {
    bucket = "i-wonder-whether-buckets-can-have-longer-names"
    path   = "gcp-playground/stage/addresses.tfstate"
  }
}
