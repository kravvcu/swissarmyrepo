# VM in a default VPC

This section is about creation of VMs in the default VPC and connecting to them through different
mechanisms:

- [Using own SSH key](ec2-ssh) - see [exercises - SSH](#exercises-ssh) for exercises

## Exercises - SSH

1. SSH into the VM from your local CLI.
1. Install some software e.g. `vim`.
1. Ping the outside world e.g. `ping www.google.com`.

## Notable mentions

- SSH access needs the following to be configured:

  - An SSH key pair.
  - A security group permitting inbound connections to the `22` port.
  - An instance configured with the abovementions SSH key pair and security group.

- If  access to external services is needed, the egress rule needs to allow it.

## Documentation:

- https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AccessingInstances.html
- https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/connection-prereqs.html
