local common = import "../../common.jsonnet";

{
  environment:: "test",
  region:: "eu-central-1",

  EnvTerraformBackend:: common.TerraformS3Backend {
    local backend = self,
    tfstate_suffix:: error "Terraform state suffix is required",

    s3_tfstate_prefix: "envs/" + $.environment + backend.tfstate_suffix
  }
}
