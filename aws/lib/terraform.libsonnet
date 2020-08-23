{
  TerraformS3Backend:: {
    backend: {
      s3: {
        bucket: "kc-playground-aws-tfstate",
        key:  "bootstrap/aws-tfstate/terraform.tfstate",
        region: "eu-central-1",
        dynamodb_table: "kc-playground-aws-tfstate-lock"
      },
    },
  },
}
