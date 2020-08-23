local terraform = import "terraform.libsonnet";

{
  'terraform.tf.json': {
    terraform: terraform.TerraformS3Backend,

    provider: {
      aws: {
        version: '~> 3.1.0',
        region: 'eu-central-1',
      },
    },

    resource: {
      aws_s3_bucket: {
        tfstate: {
          bucket: 'kc-playground-aws-tfstate',
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
          name: 'kc-playground-aws-tfstate-lock',

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
  },
}
