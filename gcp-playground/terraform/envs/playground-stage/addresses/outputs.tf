output "k8s-master-host-ip" {
  value = "${google_compute_address.k8s-master-public-address.address}"
}
