local terraform = import "terraform.libsonnet";
local vpc = import "vpc.libsonnet";
local common = import "../../../common.jsonnet";
local env = import "../env.jsonnet";

{
  local vals = {
    cidr_block:: "10.1.0.0/16"
  },

  'aws_vpc.tf.json': terraform.TerraformS3Backend + vpc.AWSVpc + common + env + vals
    { s3_tfstate_prefix: "envs/" + env.environment + "/vpc" }
}
