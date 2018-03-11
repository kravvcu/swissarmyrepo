output "k8s_master_host" {
  value = "${google_compute_instance.k8s_master.network_interface.address}"
}