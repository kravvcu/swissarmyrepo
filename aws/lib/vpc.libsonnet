local provider = import "provider.libsonnet";

{
  AWSVpc:: provider.AWSProvider {
    local aws_vpc = self,

    cidr_block:: error "CIDR block for the AWS VPC is required",

    resource: {
      aws_vpc: {
        main: {
          cidr_block: aws_vpc.cidr_block
        }
      }
    }
  }
}
