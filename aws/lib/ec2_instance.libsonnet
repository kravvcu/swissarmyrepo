{
  AWSAMI:: {
    local ami = self,

    name:: "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*",
    virtualization_type:: "hvm",
    owner:: "099720109477", # Canonical

    ami: {
      most_recent: true,

      filter: [
        {
          name: "name",
          values: [ami.name],
        },

        {
          name: "virtualization-type",
          values: [ami.virtualization_type],
        }
      ],

      owners: [ami.owner]
    }
  },

  AWSInstance:: {
    local instance = self,

    name:: error "Name for the AWS EC2 Instance is required",
    ami: error "AMI for the AWS EC2 Instance '" + instance.name + "' is required",
    instance_type: "t2.micro",

    tags: {
      Name: instance.name
    }
  }
}
