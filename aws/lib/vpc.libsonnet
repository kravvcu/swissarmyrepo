{
  AWSVpc:: {
    local aws_vpc = self,

    name:: error "Name for the AWS VPC is required",
    cidr_block: error "CIDR block for the AWS VPC is required",

    tags: {
      Name: aws_vpc.name,
    }
  }
}
