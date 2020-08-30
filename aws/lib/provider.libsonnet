{
  AWSProvider:: {
    local provider = self,

    region:: error "AWS region needs to be defined",

    provider: {
      aws: {
        version: '~> 3.1.0',
        region: provider.region,
      },
    },
  },
}
