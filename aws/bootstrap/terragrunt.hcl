remote_state {
  backend = "s3"

  generate = {
    path      = "_terraform_backend.tf"
    if_exists = "overwrite"
  }

  config = {
    bucket  = "kc-playground-aws-tfstate"
    key     = "bootstrap/${path_relative_to_include()}/terraform.tfstate"
    region  = "eu-central-1"
  }
}

terraform {
   source = "${path_relative_from_include()}/../modules/${path_relative_to_include()}"
}

inputs = {
  region = "eu-central-1"
}
