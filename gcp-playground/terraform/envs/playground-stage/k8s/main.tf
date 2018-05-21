module "k8s" {
  source = "../../../modules/k8s"

  master_name = "${var.environment-prefix}-k8s-master"
  master_public_address = "${data.terraform_remote_state.addresses.k8s-master-host-ip}"

  slave_name_prefix = "${var.environment-prefix}-k8s-slave"
  subnetwork  = "${data.terraform_remote_state.network.network_name}"
}
