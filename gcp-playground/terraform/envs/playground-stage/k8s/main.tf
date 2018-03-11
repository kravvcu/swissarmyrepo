module "k8s" {
  source = "../../../modules/k8s"

  master_name = "stage-kube-master"
  network     = "${data.terraform_remote_state.network.network_name}"
}