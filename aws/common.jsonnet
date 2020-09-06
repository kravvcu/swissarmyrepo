local terraform = import "terraform.libsonnet";

{
  TerraformS3Backend: terraform.TerraformS3Backend {
    bucket_name:: 'kc-playground-aws-tfstate',
    region:: 'eu-central-1',
    dynamodb_table:: 'kc-playground-aws-tfstate-lock',
  }
}
