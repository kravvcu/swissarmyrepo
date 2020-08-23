local terraform = import "terraform.libsonnet";
local aws_tfstate = import "aws_tfstate.libsonnet";

{
  'terraform.tf.json': terraform.TerraformS3Backend + aws_tfstate.AWSTerraformState
}
