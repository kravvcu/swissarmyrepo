# VM in a default VPC

This section is about creation of VMs in the default VPC and connecting to them through different
mechanisms:

- Using a pre-provisioned, own SSH key - see [Exercises - SSH](#exercises-ssh).
- Using Instance Connect - see [Exercises - Instance Connect](#exercises-instance-connect).

## Documentation:

- https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/connection-prereqs.html
- https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AccessingInstances.html

## Exercises - SSH

1. SSH into the VM from your local CLI.
1. Install some software e.g. `vim`.
1. Ping the outside world e.g. `www.google.com`.

<details>
  <summary>Show solution</summary>
  <p>

  ```bash
  # fetch the IP of your instance (assuming you only have one) and run SSH
  # note that the user might differ depending on the OS

  INSTANCE
  _IP=$(aws ec2 describe-instances --query 'Reservations[*].Instances[*].{Name:PublicIpAddress}' --output text)
  ssh ubuntu@${INSTANCE_IP}

  sudo apt update && sudo apt install -y vim
  ping www.google.com
  ```

  </p>
</details>


## Exercises - Instance Connect

1. Connect to the VM using the browser.
1. Connect to the VM using SSH with Instance Connect.

## Notable mentions

- SSH access needs the following to be configured:

  - An SSH key pair.
  - A security group permitting inbound connections to the `22` port.
  - An instance configured with the abovementions SSH key pair and security group.

- If  access to external services is needed, the egress rule needs to allow it.
