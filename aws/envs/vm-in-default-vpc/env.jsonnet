local common = import "../../common.jsonnet";

{
  environment:: "vm-default-vpc",
  region:: "eu-west-2",

  EnvTerraformBackend:: common.TerraformS3Backend {
    local backend = self,
    tfstate_suffix:: error "Terraform state suffix is required",

    s3_tfstate_prefix: "envs/" + $.environment + backend.tfstate_suffix
  },
}
