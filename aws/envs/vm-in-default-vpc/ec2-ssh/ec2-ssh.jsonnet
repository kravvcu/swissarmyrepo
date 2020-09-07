local provider = import "aws_provider.libsonnet";
local env = import "../env.jsonnet";

local instance = import "ec2_instance.libsonnet";

{
  vpc_id:: 'vpc-baa0e8d2',
  resource_name_prefix:: 'vm-in-default-vpc-',
  cidr_blocks:: 'Replace with own IP in CIDR format to permit SSH',

  'terraform.tf.json': env.EnvTerraformBackend {
    tfstate_suffix: "/ec2-ssh"
  },

  'providers.tf.json': {
    provider: provider.AWSProvider {
      region: env.region
    }
  },

  'ec2-ssh.tf.json': {
    data: {
      aws_ami: instance.AWSAMI
    },

    resource: {
      aws_key_pair: {
        kp: {
          key_name_prefix: $.resource_name_prefix,
          public_key: '${file("~/.ssh/id_rsa.pub")}',
        },
      },
      aws_security_group: {
        permit_ssh: {
          name_prefix: $.resource_name_prefix,
          vpc_id: $.vpc_id,

          ingress: [{
            description: "Permit inbound SSH traffic",
            from_port: "22",
            to_port: "22",
            protocol: "tcp",
            cidr_blocks: [$.cidr_blocks],

            # required
            ipv6_cidr_blocks: [],
            'self': false,
            prefix_list_ids: [],
            security_groups: [],
          }],

          egress: [{
            description: "Permit all outbound traffic",
            from_port: "0",
            to_port: "0",
            protocol: "-1",
            cidr_blocks: ["0.0.0.0/0"],

            # required
            ipv6_cidr_blocks: [],
            'self': false,
            prefix_list_ids: [],
            security_groups: [],
          }]
        },
      },
      aws_instance: {
        ubuntu: instance.AWSInstance {
          name: "vm-in-default-vpc",
          ami: "${data.aws_ami.ami.id}",
          vpc_security_group_ids: [
            "${aws_security_group.permit_ssh.id}",
          ],
          key_name: '${aws_key_pair.kp.key_name}',
        }
      }
    },
  }
}
