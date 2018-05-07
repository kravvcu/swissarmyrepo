resource "google_compute_address" "k8s-master-public-address" {
  name = "${var.environment-prefix}-k8s-master"
}
