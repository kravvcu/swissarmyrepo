local aws_provider = import "aws_provider.libsonnet";

local aws_tfstate = import "aws_tfstate.libsonnet";
local common = import "../../../common.jsonnet";

{
  'terraform.tf.json': common.TerraformS3Backend {
    s3_tfstate_prefix:: 'bootstrap/common/aws-tfstate'
  },

  'providers.tf.json': {
    provider: aws_provider.AWSProvider {
      region: common.TerraformS3Backend.region,
    }
  },

  'aws_tfstate.tf.json': {
    resource: aws_tfstate.AWSTerraformState {
      bucket_name:: common.TerraformS3Backend.bucket_name,
      region:: common.TerraformS3Backend.region,
      dynamodb_table:: common.TerraformS3Backend.dynamodb_table,
    }
  }
}
