# AWS

## Prerequisites

### Reaching AWS API

Log into AWS and generate an access key and secret access key and export them to env variables:

```bash
  export AWS_ACCESS_KEY_ID=
  export AWS_SECRET_ACCESS_KEY=
```

That's it. You can start using AWS through Terraform now.

## Certified Solutions Architect

This part of the repository contains Jsonnet code to setup AWS infrastructure for different lab
scenarios for learning purposes.

- [VM in default VPC](./envs/vm-in-default-vpc/README.md)
