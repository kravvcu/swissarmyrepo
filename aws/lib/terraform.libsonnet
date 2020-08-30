{
  TerraformS3Backend:: {
    local backend = self,

    tfstate_bucket:: error "Name of the Terraform state bucket is required",
    s3_tfstate_prefix:: error "Prefix of the Terraform state path is required",
    tfstate_bucket_region:: error "AWS region of the Terraform state bucket is required",
    tfstate_dynamodb_table:: error "Name of the DynamoDB table for Terraform state locking is required",

    terraform: {
      backend: {
        s3: {
          bucket: backend.tfstate_bucket,
          key: backend.s3_tfstate_prefix + '/terraform.tfstate',
          region: backend.tfstate_bucket_region,
          dynamodb_table: backend.tfstate_dynamodb_table,
        },
      },
    },
  },
}
