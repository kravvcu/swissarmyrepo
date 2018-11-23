module "k8s" {
  source = "../../../modules/k8s"

  master_name_prefix = "${var.environment-prefix}-k8s-master"
  slave_name_prefix = "${var.environment-prefix}-k8s-slave"

  subnetwork  = "${data.terraform_remote_state.network.network_name}"

  no_k8s_slaves = "${var.no_k8s_slaves}"
  no_k8s_masters = "${var.no_k8s_masters}"

  master_boot_disk_size = "${var.master_boot_disk_size}"
  slave_boot_disk_size = "${var.slave_boot_disk_size}"
}
