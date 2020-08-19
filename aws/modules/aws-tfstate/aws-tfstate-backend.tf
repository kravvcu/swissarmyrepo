provider "aws" {
  version = "~> 3.1.0"
  region  = var.region
}

resource "aws_s3_bucket" "tfstate" {
  bucket = "kc-playground-aws-tfstate"
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}
