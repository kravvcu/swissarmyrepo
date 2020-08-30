local terraform = import "terraform.libsonnet";
local aws_tfstate = import "aws_tfstate.libsonnet";
local common = import "../../../common.jsonnet";

{
  'terraform.tf.json': terraform.TerraformS3Backend + aws_tfstate.AWSTerraformState +
    common { s3_tfstate_prefix: 'bootstrap/common/aws-tfstate' } { region: common.tfstate_bucket_region }
}
