local terraform = import "terraform.libsonnet";
local common = import "../../common.jsonnet";

{
  environment:: "test",
  region:: "eu-central-1",

  EnvTerraformBackend:: terraform.TerraformS3Backend + common {
    local backend = self,
    s3_tfstate_suffix:: error "Terraform S3 state suffix is required",

    s3_tfstate_prefix: "envs/" + $.environment + backend.s3_tfstate_suffix
  }
}
