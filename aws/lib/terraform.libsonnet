{
  TerraformS3Backend:: {
    local backend = self,

    bucket_name:: error "Name of the Terraform state bucket is required",
    region:: error "AWS region of the Terraform state bucket is required",
    dynamodb_table:: error "Name of the DynamoDB table for Terraform state locking is required",

    s3_tfstate_prefix:: error "Prefix of the Terraform state path is required",

    terraform: {
      backend: {
        s3: {
          bucket: backend.bucket_name,
          key: backend.s3_tfstate_prefix + '/terraform.tfstate',
          region: backend.region,
          dynamodb_table: backend.dynamodb_table,
        },
      },
    },
  },
}
