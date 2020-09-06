{
  AWSTerraformState:: {
    local aws_tfstate = self,

    bucket_name:: error "Name of the Terraform state bucket is required",
    dynamodb_table:: error "Name of the DynamoDB table for Terraform state locking is required",

    aws_s3_bucket: {
      tfstate: {
        bucket: aws_tfstate.bucket_name,
        acl: 'private',

        versioning: {
          enabled: true,
        },

        server_side_encryption_configuration: {
          rule: {
            apply_server_side_encryption_by_default: {
              sse_algorithm: 'AES256',
            },
          },
        },

        lifecycle: {
          prevent_destroy: true,
        },
      },  // tfstate
    },  // aws_s3_bucket

    aws_dynamodb_table: {
      tfstate_lock: {
        name: aws_tfstate.dynamodb_table,

        read_capacity: 1,
        write_capacity: 1,

        hash_key: 'LockID',

        attribute: {
          name: 'LockID',
          type: 'S',
        },
      },  // tfstate_lock
    },  // aws_dynamodb_table
  },
}
