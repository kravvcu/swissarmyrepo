local aws_provider = import "aws_provider.libsonnet";

local vpc = import "vpc.libsonnet";
local env = import "../env.jsonnet";

{
  cidr_block:: "10.1.0.0/16",
  vpc_name:: "my-custom-vpc",

  'terraform.tf.json': env.EnvTerraformBackend {
    s3_tfstate_suffix: "/vpc"
  },

  'providers.tf.json': {
    provider: aws_provider.AWSProvider {
      region: env.region
    }
   },

  'aws_vpc.tf.json': {
    resource: {
      aws_vpc: {
        main: vpc.AWSVpc {
          name: $.vpc_name,
          cidr_block: $.cidr_block
        }
      }
    }
  }
}
