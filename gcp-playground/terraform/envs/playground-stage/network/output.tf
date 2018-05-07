output "network_name" {
  value = "${google_compute_network.playground-network.name}"
}

output "subnetwork_name" {
  value = "${google_compute_subnetwork.playground-subnet.name}"
}
