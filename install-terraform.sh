#!/bin/bash

which terraform > /dev/null && echo "Terraform is already installed." && exit 1

wget https://releases.hashicorp.com/terraform/0.11.3/terraform_0.11.3_linux_amd64.zip \
  -O /tmp/terraform.zip

unzip /tmp/terraform.zip -d /usr/local/bin
chmod +x /usr/local/bin/terraform && rm /tmp/terraform*
