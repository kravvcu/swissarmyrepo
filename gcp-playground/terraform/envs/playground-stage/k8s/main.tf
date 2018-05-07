module "k8s" {
  source = "../../../modules/k8s"

  master_name = "playground-kube-master"
  subnetwork     = "${data.terraform_remote_state.network.network_name}"
}
